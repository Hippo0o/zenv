FROM archlinux:latest

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ=Europe/Berlin

# installs
RUN pacman -Syu --noconfirm --needed \
    git \
    base-devel \
    docker docker-compose \
    sshfs rsync openssh \
    go \
    python python-pip \
    nodejs npm yarn \
    ruby rubygems \
    php composer

# define users
ARG USER=hostuser
ARG UID=1000
ARG CONTAINER_HOME=/var/hostuser
RUN useradd -m ${USER} --uid=${UID} -d ${CONTAINER_HOME}

ENV HOST_USER=${USER}
ENV HOST_DIR=${CONTAINER_HOME}
ENV HOST_UID=${UID}

ARG AUR_USER=ab
COPY add-aur.sh /tmp/add-aur.sh
RUN chmod +x /tmp/add-aur.sh && /tmp/add-aur.sh ${AUR_USER}

# install zsh
RUN pacman -Syu --noconfirm --needed zsh \
    zsh-completions zsh-theme-powerlevel10k zsh-autosuggestions
RUN aur-install oh-my-zsh-git
RUN ln -s /usr/share/zsh-theme-powerlevel10k /usr/share/oh-my-zsh/custom/themes/powerlevel10k
RUN ln -s /usr/share/zsh/plugins/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN chsh -s /bin/zsh && chsh -s /bin/zsh ${USER}

# install neovim
RUN aur-install neovim-git
RUN aur-install neovim-remote
RUN aur-install neovim-plug
RUN ln -s /bin/nvim /bin/vi
RUN pacman -Syu --noconfirm --needed python-pynvim \
    stylua prettier eslint
RUN pip install beautysh
RUN composer global require php-stubs/wordpress-globals php-stubs/wordpress-stubs php-stubs/woocommerce-stubs php-stubs/acf-pro-stubs wpsyntex/polylang-stubs php-stubs/genesis-stubs php-stubs/wp-cli-stubs

# install dotfiles
COPY --chown=root:root dotfiles /dotfiles
COPY --chown=${USER}:${USER} user-dotfiles /user-dotfiles
COPY sync-dotfiles.sh /sync-dotfiles.sh
RUN /sync-dotfiles.sh

COPY nvim-setup.sh /nvim-setup.sh
RUN /nvim-setup.sh

RUN rm -rf /root/.cache
RUN mkdir -p /root/.ssh/sockets
RUN mkdir -p /root/.cache/oh-my-zsh
RUN mkdir -p ${CONTAINER_HOME}/.cache/oh-my-zsh && chown -R ${USER}:${USER} ${CONTAINER_HOME}/.cache

# install tools
RUN pacman -Syu --noconfirm --needed \
    direnv abduco fd ripgrep fzf jq \
    wl-clipboard \
    htop strace

# system settings
COPY ./ssh_config /etc/ssh/ssh_config

# cleanup
RUN pacman -Scc --noconfirm
RUN rm -rf /tmp/*
RUN rm -rf /usr/local/share/.cache

# defaults
ENV TERM=xterm-256color
ENV SHELL=/bin/zsh
ENV VISUAL=nvim
ENV EDITOR=nvim

VOLUME ${CONTAINER_HOME}

WORKDIR /workdir

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

COPY ./new-exec /new-exec
COPY ./kill-exec /kill-exec
COPY ./user-shell /user-shell

CMD ["sleep", "inf"]

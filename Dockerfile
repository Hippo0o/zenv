FROM archlinux:latest

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ=Europe/Berlin

# installs
RUN pacman -Syu --noconfirm --needed \
git \
base-devel \
docker \
docker-compose \
sshfs \
rsync \
openssh \
go \
python \
python-pip \
nodejs \
npm \
yarn \
ruby \
rubygems \
php \
composer

# define users
ARG HOST_USER=hostuser
ARG HOST_UID=1000
ARG HOST_USER_CONTAINER_HOME=/var/hostuser
RUN useradd -m ${HOST_USER} --uid=${HOST_UID} -d ${HOST_USER_CONTAINER_HOME}

ARG USER=jailed
ARG UID=1010
ARG USER_HOME=/var/jailed
RUN useradd -m ${USER} --uid=${UID} -d ${USER_HOME}

ENV JAILED_USER=${USER}
ENV JAILED_DIR=${USER_HOME}
ENV JAILED_UID=${UID}
ENV HOST_USER=${HOST_USER}
ENV HOST_DIR=${HOST_USER_CONTAINER_HOME}
ENV HOST_UID=${HOST_UID}

ARG AUR_USER=ab
COPY add-aur.sh /tmp/add-aur.sh
RUN chmod +x /tmp/add-aur.sh && /tmp/add-aur.sh ${AUR_USER}

# install zsh
RUN pacman -S --noconfirm --needed zsh \
    zsh-completions zsh-theme-powerlevel10k zsh-autosuggestions
RUN aur-install oh-my-zsh-git
RUN ln -s /usr/share/zsh-theme-powerlevel10k /usr/share/oh-my-zsh/custom/themes/powerlevel10k
RUN ln -s /usr/share/zsh/plugins/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN chsh -s /bin/zsh && chsh -s /bin/zsh ${HOST_USER} && chsh -s /bin/zsh ${USER}

# install neovim
RUN aur-install neovim-git
RUN aur-install neovim-remote
RUN aur-install neovim-plug
RUN pacman -S --noconfirm --needed python-pynvim
RUN ln -s /bin/nvim /bin/vi

# install tools
RUN pacman -Syu --noconfirm --needed \
ttf-nerd-fonts-symbols-1000-em-mono otf-firamono-nerd \
direnv abduco fd ripgrep fzf \
wl-clipboard

# install dotfiles
COPY --chown=root:root dotfiles /dotfiles
COPY sync-dotfiles.sh /sync-dotfiles.sh
RUN /sync-dotfiles.sh

RUN PLUG_INSTALL=1 nvim --headless +PlugInstall +qall #&& nvim --headless +"TSInstallSync all" +qall
RUN rm -rf /root/.cache
RUN mkdir -p /root/.ssh/sockets
RUN mkdir -p /root/.cache/oh-my-zsh

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

VOLUME ["${HOST_USER_CONTAINER_HOME}", "/root"]

WORKDIR /root

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

CMD ["tail", "-f", "/dev/null"]

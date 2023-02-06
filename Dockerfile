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
RUN useradd -m ${HOST_USER} --uid=${HOST_UID}

ARG USER=jailed
ARG UID=1010
RUN useradd -m ${USER} --uid=${UID}

ENV JAILED_USER=${USER}
ENV JAILED_DIR=/home/${USER}
ENV HOST_DIR=/home/${USER}
ENV HOST_USER=${HOST_USER}
ENV HOST_DIR=/home/${HOST_USER}
ENV HOST_UID=${HOST_UID}

RUN rm -rf /root/
VOLUME /root

COPY dotfiles/. /root
COPY --chown=${USER}:${USER} dotfiles/. /home/${USER}/.

COPY add-aur.sh /tmp/add-aur.sh
RUN chmod +x /tmp/add-aur.sh && /tmp/add-aur.sh

# install zsh
RUN pacman -S --noconfirm --needed zsh \
    zsh-completions zsh-theme-powerlevel10k zsh-autosuggestions
RUN aur-install oh-my-zsh-git
RUN ln -s /usr/share/zsh-theme-powerlevel10k /usr/share/oh-my-zsh/custom/themes/powerlevel10k
RUN ln -s /usr/share/zsh/plugins/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN mkdir -p /root/.cache/oh-my-zsh
RUN mkdir -p /home/$USER/.cache/oh-my-zsh
RUN chown -R $USER: /home/$USER/.cache
RUN chsh -s /bin/zsh && chsh -s /bin/zsh ${USER}

# install neovim
RUN aur-install neovim-git
RUN aur-install neovim-remote
RUN aur-install neovim-plug
RUN pacman -S --noconfirm --needed python-pynvim
RUN ln -s /bin/nvim /bin/vi
RUN PLUG_INSTALL=1 nvim --headless +PlugInstall +qall

RUN pacman -Syu --noconfirm --needed \
otf-firamono-nerd \
direnv abduco fd ripgrep fzf

# cleanup
RUN pacman -Scc --noconfirm
RUN rm -rf /tmp/*

# defaults
ENV TERM=xterm-256color
ENV SHELL=/bin/zsh
ENV VISUAL=nvim
ENV EDITOR=nvim

RUN mkdir -p /root/workdir && chown -R ${HOST_USER}:${HOST_USER} /root/workdir
WORKDIR /root

CMD ["tail", "-f", "/dev/null"]

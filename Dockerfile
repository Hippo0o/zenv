FROM archlinux:latest

# define user
ARG USER=hostuser
ARG UID=1000
ARG GID=1000
RUN useradd -m ${USER} --uid=${UID}

COPY dotfiles/. /root
COPY --chown=${USER}:${USER} dotfiles/. /home/${USER}/.

# installs
RUN pacman -Syu --noconfirm --needed \
git \
base-devel \
docker \
docker-compose \
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

COPY add-aur.sh /tmp/add-aur.sh
RUN chmod +x /tmp/add-aur.sh && /tmp/add-aur.sh

COPY install-zsh.sh /tmp/install-zsh.sh
RUN chmod +x /tmp/install-zsh.sh && /tmp/install-zsh.sh

COPY install-neovim.sh /tmp/install-neovim.sh
RUN chmod +x /tmp/install-neovim.sh && /tmp/install-neovim.sh

# cleanup
RUN pacman -Scc --noconfirm
RUN rm -rf /tmp/*

# defaults
ENV TERM=xterm-256color
ENV SHELL=/bin/zsh
ENV HOST_USER=${USER}
ENV HOST_DIR=/home/${USER}
VOLUME /home/${USER}
WORKDIR /home/${USER}
CMD ["/bin/zsh"]

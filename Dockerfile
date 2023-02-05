FROM archlinux:latest

# define user
ARG USER=hostuser
ARG UID=1000
ARG GID=1000
RUN useradd -m ${USER} --uid=${UID} -s /bin/zsh

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
VOLUME /home/${USER}
WORKDIR /home/${USER}
#USER ${USER}
CMD ["/bin/zsh"]

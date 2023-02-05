#!/bin/sh

pacman -S --noconfirm --needed zsh \
    zsh-completions zsh-theme-powerlevel10k zsh-autosuggestions

pacman -S --noconfirm --needed direnv abduco

aur-install oh-my-zsh-git

ln -s /usr/share/zsh-theme-powerlevel10k /usr/share/oh-my-zsh/custom/themes/powerlevel10k
ln -s /usr/share/zsh/plugins/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions

mkdir -p /root/.cache/oh-my-zsh
mkdir -p /home/$USER/.cache/oh-my-zsh
chown -R $USER: /home/$USER/.cache

chsh -s /bin/zsh
chsh -s /bin/zsh ${USER}

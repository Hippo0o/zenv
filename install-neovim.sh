#!/bin/sh

aur-install neovim-git
aur-install neovim-remote
aur-install neovim-plug

pacman -S --noconfirm --needed python-pynvim

ln -s /bin/nvim /bin/vi

runuser $USER -c 'PLUG_INSTALL=1 nvim +PlugInstall +qall'
cp -r /home/$USER/.config/nvim/plugged /root/.config/nvim/plugged

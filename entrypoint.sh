#! /bin/bash

cp -r /dotfiles/. /root/.
cp -r /dotfiles/. $JAILED_DIR/.
chown -R ${JAILED_USER}: $JAILED_DIR

echo "export PLUG_INSTALL=1" > /tmp/nvim_install
echo "nvim --headless +PlugInstall +qall" >> /tmp/nvim_install
echo "nvim --headless +TSInstallSync all +qall" >> /tmp/nvim_install
chmod +x /tmp/nvim_install

/tmp/nvim_install
runuser $JAILED_USER /tmp/nvim_install

tail -f /dev/null

#! /bin/bash

cp -r /dotfiles/. /root/.
cp -r /dotfiles/. $JAILED_DIR/.
chown -R ${JAILED_USER}: $JAILED_DIR

tail -f /dev/null

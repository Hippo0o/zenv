#! /bin/bash

rsync -a /dotfiles/. /root/.
rsync -a /dotfiles/. $JAILED_DIR/. --chown=$JAILED_USER:$JAILED_USER
rsync -a /dotfiles/. $HOST_DIR/. --chown=$HOST_USER:$HOST_USER

#! /bin/bash

rsync -ahP /dotfiles/. /root/.
rsync -ahP /dotfiles/. $JAILED_DIR/. --chown=$JAILED_USER:$JAILED_USER
rsync -ahP /dotfiles/. $HOST_DIR/. --chown=$HOST_USER:$HOST_USER

#! /bin/bash

rsync -ahP /dotfiles/. /root/.
rsync -ahP /dotfiles/. $HOST_DIR/. --chown=$HOST_USER:$HOST_USER
rsync -ahP /user-dotfiles/. $HOST_DIR/. --chown=$HOST_USER:$HOST_USER

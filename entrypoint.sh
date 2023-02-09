#!/bin/bash

mkdir -p $JAILED_DIR/.local/share && chown -R $JAILED_USER: $JAILED_DIR/.local
mkdir -p $JAILED_DIR/.config/nvim/plugged && chown -R $JAILED_USER: $JAILED_DIR/.config/nvim
rsync -a --exclude=.git /root/.local/share/. $JAILED_DIR/.local/share/. --chown=$JAILED_USER:$JAILED_USER
rsync -a --exclude=.git /root/.config/nvim/plugged/. $JAILED_DIR/.config/nvim/plugged/. --chown=$JAILED_USER:$JAILED_USER

mkdir -p $HOST_DIR/.local/share && chown -R $HOST_USER: $HOST_DIR/.local
mkdir -p $HOST_DIR/.config/nvim/plugged && chown -R $HOST_USER: $HOST_DIR/.config/nvim
rsync -a --exclude=.git /root/.local/share/. $HOST_DIR/.local/share/. --chown=$HOST_USER:$HOST_USER
rsync -a --exclude=.git /root/.config/nvim/plugged/. $HOST_DIR/.config/nvim/plugged/. --chown=$HOST_USER:$HOST_USER

$@

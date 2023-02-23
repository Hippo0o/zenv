#!/bin/bash

PLUG_INSTALL=1 nvim --headless +PlugUpdate +qall

nvim --headless +'MasonInstall bash-language-server clangd lua-language-server vim-language-server emmet-ls html-lsp json-lsp intelephense php-debug-adapter sqls jdtls pyright lemminx marksman vue-language-server tailwindcss-language-server typescript-language-server' +qall

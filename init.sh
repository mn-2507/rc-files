#!/bin/sh

set -euo pipefail

VIM_PLUGIN_DIR="$HOME/.vim/pack/git-plugins/start"
declare -a VIM_PLUGINS=("dense-analysis/ale" "cespare/vim-toml")

if [ ! -d "$VIM_PLUGIN_DIR" ]; then
    mkdir -p "$VIM_PLUGIN_DIR"
else
    echo "$VIM_PLUGIN_DIR already exists."
fi

for VIM_PLUGIN_PATH in ${VIM_PLUGINS[@]}; do
    IFS='/'
    read -ra VIM_PLUGIN_PATH_CHUNKS <<< "$VIM_PLUGIN_PATH"
    VIM_PLUGIN_NAME=${VIM_PLUGIN_PATH_CHUNKS[1]}

    if [ ! -d "$VIM_PLUGIN_DIR/$VIM_PLUGIN_NAME" ]; then
        git clone --depth 1 "https://github.com/$VIM_PLUGIN_PATH.git" "$VIM_PLUGIN_DIR/$VIM_PLUGIN_NAME"
    else
        echo "Directory $VIM_PLUGIN_DIR/$VIM_PLUGIN_NAME already exists. Nothing to do."
    fi
done
# reset to default value
IFS=' '

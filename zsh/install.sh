#!/bin/sh

echo "> setup .zshrc..."

if [ -f "$HOME/.zshrc" ]; then
  time=$(date +%Y%m%d%H%M%S)
  echo ">[INFO] .zshrc is already exists"
  rename="mv \"$HOME/.zshrc\" \"$HOME/.zshrc.bk$time\""
  echo $rename
  eval "$rename"
fi

CURRENT_DIR=$(
  cd $(dirname $0)
  pwd
)

echo "cd \"$HOME\""
cd "$HOME"

echo "ln -s $CURRENT_DIR/.zshrc ~/.zshrc"
ln -s $CURRENT_DIR/.zshrc ~/.zshrc

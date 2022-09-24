#!/bin/sh

echo "> setup prettier setting file..."

SETTINGS_FILE=.prettierrc

if [ -f "$HOME/$SETTINGS_FILE" ]; then
  time=$(date +%Y%m%d%H%M%S)
  echo ">[INFO] $SETTINGS_FILE is already exists"
  rename="mv \"$HOME/$SETTINGS_FILE\" \"$HOME/.prettierrc.bk$time\""
  echo $rename
  eval "$rename"
fi

CURRENT_DIR=$(
  cd $(dirname $0)
  pwd
)
cd "$HOME"
ln -s $CURRENT_DIR/$SETTINGS_FILE ./$SETTINGS_FILE

#!/bin/sh

echo "> setup vscode settings.json..."

SETTINGS_DIR="$HOME/Library/Application Support/Code/User"
SETTINGS_FILE=settings.json

if [ -f "$SETTINGS_DIR/$SETTINGS_FILE" ]; then
  time=$(date +%Y%m%d%H%M%S)
  echo ">[INFO] settings.json is already exists"
  rename="mv \"$SETTINGS_DIR/$SETTINGS_FILE\" \"$SETTINGS_DIR/settings.bk$time.json\""
  echo $rename
  eval "$rename"
fi

CURRENT_DIR=$(
  cd $(dirname $0)
  pwd
)
cd "$SETTINGS_DIR"
ln -s $CURRENT_DIR/settings.json ./$SETTINGS_FILE

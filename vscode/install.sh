#!/bin/sh

echo "> setup vscode settings.json..."

WIN_DIR="$HOME/AppData/Roaming/Code/User"
MAC_DIR="$HOME/Library/Application Support/Code/User"
LINUX_DIR="$HOME/.config/Code/User"

SETTINGS_DIR=
SETTINGS_FILE=settings.json

case ${OSTYPE} in
  darwin*)
    SETTINGS_DIR="$MAC_DIR"
    ;;
  linux*)
    SETTINGS_DIR="$LINUX_DIR"
    ;;
  msys*)
    SETTINGS_DIR="$WIN_DIR"
    ;;
esac

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

echo "cd \"$SETTINGS_DIR\""
cd "$SETTINGS_DIR"

# Windows(Git Bash)の場合はlnしてもシンボリックリンクは作成されずに単にコピーされる
# 対応するには設定と管理者権限でGit Bashを動かす必要がある模様(面倒なので対応しない)
echo "ln -s $CURRENT_DIR/settings.json ./$SETTINGS_FILE"
ln -s $CURRENT_DIR/settings.json ./$SETTINGS_FILE

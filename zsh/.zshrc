# export ENV
export LSCOLORS=cxfxcxdxbxegedabagacad

# setup alias
alias ll='ls -lGF'
alias ls='ls -GF'

# setup history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000
setopt inc_append_history
setopt share_history

# setup git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# customize prompt
PROMPT='
[%B%F{cyan}%n@%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '

# setup peco-ghq
peco-src () {
  local repo=$(ghq list | peco --query "$LBUFFER")
  if [ -n "$repo" ]; then
    repo=$(ghq list --full-path --exact $repo)
    BUFFER="cd ${repo}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src

# setup peco-history
peco-history-selection() {
  BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^h' peco-history-selection

if [ -d ~/.asdf ]; then
  source ~/.asdf/asdf.sh
fi

# ユーティリティ
docker-login() {
  # TODO インストールスクリプトを用意すること
  # ホームディレクトリ下にdocker-user.jsonが配置されている前提
  user=$(cat docker-user.json | jq -r .user)
  password=$(cat docker-user.json | jq -r .password)
  echo $password | docker login --username $user --password-stdin
}

# OS別設定
case ${OSTYPE} in
  darwin*)
    ;;
  linux*)
    alias ls='ls --color=auto'
    ;;
  msys*)
    alias ls='ls --color=auto'
    ;;
esac

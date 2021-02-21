# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# gitコマンドの補完設定
fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit -u

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt PROMPT_SUBST
source ~/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
#GIT_PS1_SHOWSTASHSTATE=1

# PROMPT='[%n@%m:%~]$(__git_ps1 " (%s)")%# '

PROMPT='
[%B%F{red}%n@%m%f%b:%F{yellow}%~%f]%F{cyan}$(__git_ps1 " (%s)")%f
%# '

# Java
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Finderで開いているディレクトリへcdするコマンド
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

# alias定義
alias his='history | grep'
alias f='open .'

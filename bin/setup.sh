#!bin/bash

## Macの初期設定スクリプト
# homebrewがinstallされていなかったら、homebrewをinstall
if [ ! -e /usr/local/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  printf '\033[33m%s\033[m\n' 'homebrew is already installed'
fi

for f in .??*
do
  [ "$f" = ".git" ] && continue
  echo "$f"
done

# make link
ln -s .vimrc ~/.vimrc
ln -s .zshrc ~/.zshrc

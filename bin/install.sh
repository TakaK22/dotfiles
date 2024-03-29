DOTPATH=~/dotfiles

## Macmの初期設定スクリプト

# homebrewがinstallされていなかったら、homebrewをinstall
if [ ! -e /usr/local/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  printf '\033[33m%s\033[m\n' 'homebrew is already installed'
fi

function command_exists() {
  type "$1" &> /dev/null ;
}

: "install dotfiles" && {
  if command_exists git; then
    git clone "https://github.com/{your_github_name}/dotfiles.git" "$DOTPATH"

  elif command_exists curl || command_exists wget; then
    tarball="https://github.com/{your_github_name}/dotfiles/archive/master.tar.gz"

    if command_exists curl; then
        curl -L "$tarball"

    elif command_exists wget; then
        wget -O - "$tarball"

    fi | tar zxv -C ~/
    mkdir -p ~/dotfiles
    mv -i ~/dotfiles-master/* "$DOTPATH" && rm -rf ~/dotfiles-master
  else
    echo "curl or wget required"
  fi
}

: "deploy and setup" && {
  cd ~/dotfiles
  if [ $? -ne 0 ]; then
    echo "not found: $DOTPATH"
  else
    sh setup.sh
  fi
}

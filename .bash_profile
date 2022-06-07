if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Java
# export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
export JAVA_HOME=/usr/bin/java
PATH=${PATH}:${JAVA_HOME}/bin

# Go
export GOPATH=$HOME/.go

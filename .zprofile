if [ -f ~/.zshrc ]; then
  . ~/.zshrc
fi

# bash_completion
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

# Java
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
PATH=${PATH}:${JAVA_HOME}/bin

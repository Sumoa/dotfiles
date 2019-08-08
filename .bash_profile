
export PATH=/usr/local/maven/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/usr/local/opt/gettext/bin:/Users/chuber/scripts
alias ll="ls -lha"

alias mci="mvn clean install"
alias mcp="mvn clean package"
alias mci_noTest="mvn clean install -D skipTests=true"
alias mcp_noTest="mvn clean package -D skipTests=true"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

function __getTotalSizeOfFiles() {
  if (( $# == 0 )); then
    find . -ls | awk '{total += $7} END {print total / 1024 " KB"}'
  else
    find . -name "$1" -ls | awk '{total += $7} END {print total / 1024 " KB"}'
  fi
}
alias filesSize="__getTotalSizeOfFiles"

function backupCurrSetup() {
  BACKUP_DIR="/Users/chuber/Documents/onedrive/OneDrive\ -\ jambit\ GmbH/setup"  

  bash -c "cd $BACKUP_DIR; brew list > brew_list.txt; brew cask list > brew_cask_list.txt; brew tap > brew_taps.txt"
  bash -c "cd $BACKUP_DIR; rm -rf code; mkdir code"
  bash -c "cd $BACKUP_DIR; cd code; cp $HOME/Library/Application\ Support/Code/User/settings.json ."
  bash -c "cd $BACKUP_DIR; cd code; cp $HOME/Library/Application\ Support/Code/User/keybindings.json ."
}

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin

PATH="${PATH}:/usr/local/bin/idea"
export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

for f in ~/.work/*; do
	source $f;
done
for f in ~/.private/*; do
	source $f;
done

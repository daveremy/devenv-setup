echo "Copying dotfiles for $USER"

# function to backup dotfile, delete it, and then create
#  symbolic link
configDotFile() {
	local dotfile="$1"
	echo Configuring dotfile: $dotfile
	if [ -f ~/$dotFile ]
	then
	    echo Backing up $dotfile to $dotfile.bak
	    mv ~/$dotfile ~/$dotfile.bak
	fi
	sudo rm -f ~/$dotfile
	echo Creating symbolic link from /vagrant/dotfiles/$dotfile to ~/$dotfile
	ln -s /vagrant/dotfiles/$dotfile ~/$dotfile
}

configDotFile .bashrc
configDotFile .bash_aliases
configDotFile .vimrc



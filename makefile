all:
	echo "init			init, clone vundle"
	echo "remote 		update .vimrc"
	echo "sensing		update vim"
init:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
remote: 
	cp vim ~/.vimrc
sensing: 
	cp ~/.vimrc vim


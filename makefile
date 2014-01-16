all:
	echo "init  init, clone vundle"
	echo "update .vimrc"
init:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
sex: 
	cp vim ~/.vimrc


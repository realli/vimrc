all:
	@echo "init         init, clone vundle"
	@echo "remote       update ~/.vimrc"
	@echo "sensing      update vim"
init:
	mkdir -p ~/.vim/autoload
	curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
remote: 
	cp vim ~/.vimrc
sensing: 
	cp ~/.vimrc vim


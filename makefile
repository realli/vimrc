all:
	echo "hello"
init:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

init_win:
	cd /d %USERPROFILE%
	git clone https//github.com/gmarik/vundle.git vimfiles/bundle/vundle

sex: 
	cp vim ~/.vimrc

shit:
	@echo off
	echo "use: cp vim %USERPROFILE%\\_vimrc"

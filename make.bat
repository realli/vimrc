@ECHO OFF

REM Command file for vim install in win

if "%1" == "" goto help

if "%1" == "help" (
	:help
	echo.  init		init, clone vundle 
	echo.  remote	update _vimrc 
	echo.  sensing	copy _vimrc to vim here
	goto end
)

if "%1" == "init" (
	:init
	cd /d %USERPROFILE%
	git clone https//github.com/gmarik/vundle.git vimfiles/bundle/vundle
)

if "%1" == "remote" (
	:remote
	copy /y vim %USERPROFILE%\\_vimrc
)

if "%1" == "sensing" (
	:sensing
	copy /y %USERPROFILE%\\_vimrc vim
)

:end


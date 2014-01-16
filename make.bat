@ECHO OFF

REM Command file for vim install in win

if "%1" == "" goto help

if "%1" == "help" (
	:help
	echo.  init		init, clone vundle 
	echo.  sex		update _vimrc 
	goto end
)

if "%1" == "init" (
	:init
	cd /d %USERPROFILE%
	git clone https//github.com/gmarik/vundle.git vimfiles/bundle/vundle
)

if "%1" == "sex" (
	:sex
	copy /y vim %USERPROFILE%\\_vimrc
)

:end


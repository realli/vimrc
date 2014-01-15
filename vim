set nocompatible              " be iMproved
filetype off                  " required!

if has('win32')
	set rtp+=~/vimfiles/bundle/vundle/
else
	set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" end of vundle
filetype plugin indent on
syntax on

" my own bundle
" color scheme molokai, like textmate
Bundle 'tomasr/molokai'
" Bundle 'nanotech/jellybeans.vim'
" Bundle 'Lokaltog/vim-distinguished'
" Bundle 'altercation/vim-colors-solarized'
" if $COLORTERM == 'gnome-terminal'
	set t_Co=256
"endif

" javascript syntax
Bundle 'jelera/vim-javascript-syntax'

" vim-airline
Bundle 'bling/vim-airline'
" tagbar
Bundle 'majutsushi/tagbar'
let g:airline#extensions#tabline#enabled = 1

" ctrlp
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " linux ignore
" set wildignore+=*\\tmp\\*,*.so,*.swp,*.zip,*.exe " windows ignore

" end of bundles
set incsearch
set nu
set autoindent

if has("vms")
	set nobackup
else
	set backup
endif

set showcmd
set ruler
set hidden

set sw=4
set ts=4
if has("gui_running")
	set guifont=Inconsolata:h14
endif
colorscheme molokai

" begin script
" maps
let mapleader = ","
let maplocalleader = "\\"

nnoremap <leader>ev :80split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>cl :close<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>le

" quick edit, located the parent dir quickly
nnoremap <leader>ee :e <C-R>=expand("%:p:h") . "/"<cr>
cnoremap <leader>ee <C-R>=expand("%:p:h") . "/"<cr>

inoremap <c-l> <c-o>zz
inoremap jk <esc>

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>

" comment for different filetypes ---------------{{{
augroup comments
	au!
	" comment short key
	autocmd FileType javascript nnoremap <localleader>c I//<esc>
	autocmd FileType javascript nnoremap <localleader>z ^xx<esc>
	autocmd FileType python nnoremap <localleader>c I#<esc>
	autocmd FileType python nnoremap <localleader>z ^x<esc>
	" auto fold in vimL using comments
	autocmd FileType vim setlocal foldmethod=marker
augroup end
" }}}

" better format like auto indention space tabs ---{{{
augroup betterformat
	au!
	autocmd BufRead,BufWritePre *.js,*.html :normal gg=G''
	autocmd FileType python setlocal et sta sw=4 sts=4
augroup end
" }}}

" tags set
set tags+=tags,/
" tagbar set , need tagbar install first
nnoremap <F8> :TagbarToggle<cr> 
augroup ctagsupdate
	au!
	au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &
augroup end

" encodings
if has("win32")
	set encoding=utf-8
	set termencoding=utf-8
	set fileencoding=utf-8
	set fileencodings=utf-8,chinese,cp936
	language messages zh_CN.utf-8
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
endif

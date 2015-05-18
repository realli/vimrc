" some global settings, plugins, and so on---------------{{{
let mapleader = ","
let maplocalleader = "\\"
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

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'Shougo/unite.vim'
Plug 'majutsushi/tagbar'
Plug 'sjl/badwolf'
Plug 'SirVer/ultisnips'
Plug 'Lokaltog/vim-easymotion'
Plug 'jelera/vim-javascript-syntax'
Plug 'wlangstroth/vim-racket'
Plug 'raichoo/haskell-vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/paredit.vim'
call plug#end()

filetype plugin indent on
syntax on
set t_Co=256

" colorscheme moloka
colorscheme badwolf
set background=light

" vim-airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" snips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" set the indent style of haskell
let g:haskell_indent_if = 0
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 0

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
set expandtab
set listchars=tab:»·,trail:·,eol:¬

if has("gui_running")
    set guioptions-=T
"    set guioptions-=m
    if has("gui_gtk")
        set guifont=Inconsolata\ Medium\ 12
    elseif has("gui_win32")
        set guifont=consolas:h12
    endif
endif

" }}}

" begin script
" maps
nnoremap <leader>ev :80split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>cl :close<cr>
nnoremap <leader>z :e.<cr>
nnoremap <leader>q :bd<cr>
nnoremap <leader>j :bn<cr>
nnoremap <leader>k :bp<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>le
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>le

" quick edit, located the parent dir quickly
nnoremap <leader>ee :e <C-R>=expand("%:p:h") . "/"<cr>
cnoremap <leader>ee <C-R>=expand("%:p:h") . "/"<cr>

inoremap <c-l> <c-o>zz
inoremap jk <esc>
inoremap <esc> <nop>

nnoremap H ^
nnoremap L $

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>
set cedit=<C-G>

" quick mapping to easy motion' move command
nmap cd <leader><leader>s
nnoremap yd :set list! <cr>
set list

" end of script
" some useful tips
" :retab       »» re format tab and space
" :set list    »» show all invisible
" :%s/\s\+$/   »» remove all trailing space

" comment for different filetypes ---------------{{{
augroup comments
    au!
    " comment short key
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript nnoremap <buffer> <localleader>z ^xx<esc>
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python nnoremap <buffer> <localleader>z ^x<esc>
    " auto fold in vimL using comments
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType python setlocal sw=4 ts=4 expandtab
    autocmd FileType haskell setlocal sw=4 ts=4 expandtab
augroup END

" }}}

" tags set
set tags+=tags,/
" tagbar set , need tagbar install first
nnoremap <F8> :TagbarToggle<cr>
augroup ctagsupdate
    au!
    au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &
augroup END








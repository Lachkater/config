" Lachkaters .vimrc 04.09

syntax on			" enable syntax highlighting
set nocompatible	" Use gVim defaults (better)
set backspace=2		" Allow backspacing over everything
set cindent			" clever autoindent
set encoding=utf-8  " unicode encoding
set foldenable		" allows folding code
set foldmethod=marker " marks foldstarts/ends with {{{ }}}
set mouse=a			" enable mouse
set mousehide		" hide mouse curor while typing
set mousetime=300   " doubleclick time
set nobackup		" Don't write backup files
set nocopyindent
set noerrorbells	" don't beep
set noswapfile		" Don't write a swap file
set report=0
set shell=/bin/zsh  " set default shell
set showbreak=>
set showmatch		" highlight matching brackets
set smartcase		" upper-case sensitive search otherwise insensitive
set gdefault		" automatically searh globally
set incsearch		" increment search
set shiftwidth=4	" allows the use of < and > for VISUAL indenting
set softtabstop=4   " counts n spaces when DELETE or BCKSPCE is used
set smarttab
set tabstop=4		" tabwith is 4spaces
"set expandtab		" insert spaces instead of tabs
set termencoding=utf-8
set ttyfast			" Improves redrawing on newer computers
set undolevels=200	" max 200 undoleves
set viminfo='20,\"500 " Keep a .viminfo file.
set wildchar=<tab>
set wildmenu
set wildmode=longest:full,full

" highlight redundant whitespaces and tabs.
"highlight RedundantSpaces ctermbg=red guibg=red
"match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

"  Enable filetype plugins and indention
filetype on
filetype plugin on
filetype indent on

" filetype specific settings
au FileType sh,php,perl,python,ruby map <F5> :!./%<CR>
au FileType java map <F5> :w<CR>:!javac "%" && java %:r<CR>
au FileType java map <F6> :!java %:r
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
au FileType python map <F5> :w<CR>:!python "%"<CR>
let python_highlight_all=1

" Bindings
nmap X :x<CR>
inoremap <C-x> <esc>:x<CR>
inoremap <C-v> <esc>p i
map + :next<CR>
map - :prev<CR>
map # :w<CR>:next<CR>
nmap S :w !sudo tee %<CR>

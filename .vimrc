" lachkaters .vimrc 7.07

syntax on
set backspace=2   " Allow backspacing over everything in insert mode
set enc=utf-8
set termencoding=utf-8
set ignorecase
set nobackup
set nocompatible  " Use gVim defaults (much better!)
set nocopyindent
set noerrorbells
"set noexpandtab
set noswapfile
set showbreak=>
set showmatch      " Klammern hervorheben
set smartcase      " upper-case sensitive search
set nosmartindent  " intelligent indenting -- DEPRECATED by cindent
set tabstop=4
set expandtab
set shiftwidth=4 
set smarttab

" highlight redundant whitespaces and tabs.
"highlight RedundantSpaces ctermbg=red guibg=red
"match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

set cindent

filetype plugin indent on

" set ls=2 " Zeige immer den Dateinamen an
set viminfo='20,\"500   " Keep a .viminfo file.
" Flag 'g=global' bei Substitute-Kommando (":s") automatisch setzen
" set gdefault
" highlighted search
" set hlsearch
set incsearch
set undolevels=250 " Standard: 1000 (wer braucht schon mehr als 250)

"  Enable filetype plugins and indention
filetype on
filetype plugin on
filetype indent on

" Wildmenu magic
set wildchar=<tab>
set wildmenu
set wildmode=longest:full,full

" Python einstellungen
" --------------------
"autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 
let python_highlight_all=1

au FileType java map <F5> :w<CR>:!javac "%" && java %:r<CR>
au FileType sh,php,perl,python,ruby map <F5> :!./%<CR>
autocmd FileType python map <F5> :w<CR>:!python "%"<CR>
au FileType java map <F6> :!java %:r
" Maus-Konfiguration
"-------------------------------------------------------------------------------
" Cursorsteuerung per Maus einschalten (a=all)
" (Kopieren per Standard-X Window-Methode geht dann zusammen mit SHIFT-Taste!!!)
"set mouse=a (Maus ist was für naps)
set mouse=a

" Maus-Klick aktiviert Fenster bei Verwendung mehrerer Windows im Vim (STRG-W)
" #set mousefocus

" Maus während dem Eintippen verstecken
set mousehide

" Maximal erlaubte Doppelklick-Verzögerung (in ms, Std: 500)
set mousetime=300

" Bindings
" --------
nmap X :x<CR> 
map! <C-c> <Esc>
inoremap <C-x> <esc>:x<CR> 
inoremap <C-s> <esc>:w<cr>a
inoremap <C-v> <esc>p i


"nmap :Q :q
"nmap :W :w

" Durch mehrere Dateien springen
" +=nächste Datei, -=vorherige, #=aktuelle schreiben und zu nächster springen
map + :n<CR>
map - :prev<CR>
map # :w<CR>:n<CR>



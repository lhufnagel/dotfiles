" Reference https://github.com/romainl/idiomatic-vimrc/blob/master/idiomatic-vimrc.vim

" 'matchit.vim' is built-in so let's enable it!
" Hit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

" set guifont=Hack\ Regular:h12

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'altercation/vim-colors-solarized'
"
"
Plugin 'NLKNguyen/papercolor-theme'


Plugin 'roosta/srcery'

Plugin 'mechatroner/rainbow_csv'

Plugin 'junegunn/fzf.vim'

Bundle 'wellle/tmux-complete.vim'

Plugin 'jerri/vimux'

Plugin 'kshenoy/vim-signature'

"Plugin 'tmhedberg/SimpylFold'

"Plugin 'klen/python-mode'

Plugin 'christoomey/vim-tmux-navigator'


Plugin 'mbbill/undotree'

Plugin 'tpope/vim-surround'

Plugin 'luochen1990/rainbow'



Plugin 'Valloric/YouCompleteMe'
"Plugin 'maralla/completor.vim'
"Plugin 'prabirshrestha/asyncomplete.vim'




"Git wrapper
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-obsession'

Plugin 'airblade/vim-gitgutter'
"
"Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'jistr/vim-nerdtree-tabs'

"Big set of language-support files
"Plugin 'sheerun/vim-polyglot'
"Class navigation bar
Plugin 'majutsushi/tagbar'

" Plugin 'elzr/vim-json'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Open Tagbar with Ctrl-t 
map <C-t> :TagbarToggle<CR>

"Open Nerdtree on startup
"autocmd vimenter * NERDTree
"" Go to previous (last accessed) window.
"autocmd VimEnter * wincmd p

" Toggle NERDTree with Ctrl-n 
map <C-n> :NERDTreeTabsToggle<CR>

autocmd FileType python map <buffer> <F2> :call Flake8()<CR>

"Close Nerdtree when last windows
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeUpdateOnWrite = 1
let g:NERDTreeCascadeSingleChildDir=0

"ycm config
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1

let g:ycm_autoclose_preview_window_after_insertion=1 " close when leaving insert mode
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 1


let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_python_binary_path = '/usr/local/bin/python3'

" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

set t_Co=256   " This is may or may not needed.

set background=dark
colorscheme PaperColor

"colorscheme srcery
"set background=dark

set rtp+=/usr/local/opt/fzf

let g:fzf_launcher = "~/.vim/bundle/fzf.vim/script.sh %s"
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "\!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)


command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? GFiles call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" fzf config
nmap <C-p> :Files<cr>
nmap <leader>b :Buffer<cr>
nmap <leader>g :GFiles<cr>
nmap <leader>v :BTags<cr>
nmap <leader>t :Tags<cr>
nmap <leader>s :Gstatus<cr>

nmap <leader>h :History<cr>
nmap <leader>f :Ag<cr>

let g:fzf_commits_log_options =  '--color=always --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cI) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
    "'--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
nmap <leader>d :BCommits<cr>
nmap <leader>m :Marks<cr>
nmap <leader>l :set list!<cr>
nmap <leader>w :set wrap!<cr>

imap <c-x><c-l> <plug>(fzf-complete-line)

"Default
"let g:fzf_action = {
  "\ 'ctrl-t': 'tab split',
  "\ 'ctrl-x': 'split',
  "\ 'ctrl-v': 'vsplit' }


let g:SimpylFold_docstring_preview=1

map <C-x> :VimuxPromptCommand<CR>

let g:tmuxcomplete#trigger = 'omnifunc'


let g:VimuxExpandCommand = 1
let g:VimuxPromptString = "> "
let g:VimuxHeight = "15"


let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 100
let g:pymode_breakpoint = 0
" don't clash with ycm
let g:pymode_rope_completion = 0


let g:pymode_lint_checker = "pyflakes"

"let g:pymode_rope = 0
"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope_autoimport = 0


set foldclose=all

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

set ttyfast
set expandtab


"my grep 
set grepprg=rg\ --vimgrep
let g:ackprg = 'ag --vimgrep'

set iskeyword+=:

let g:tex_flavor='latex'

" using fish on mac seems to break Vundle..
set shell=/bin/bash

set ttymouse=xterm2
set mouse=hnvi            " Maus im Help-Modus aktivieren. |Links| werden per Doppelklick
                        " besucht (mit Tasten: C-+). Zurück mit g+<rechte
                        " Maustaste>
                        "                         " oder STRG+t oder STRG+o.

set nojoinspaces        " Einfügen von 2 Leerzeichen nach "!", "." und "?" ausschalten.


"set clipboard=unnamed


map <SPACE> <leader>

" - and + to resize horizontal splits
map - 2<C-W>-
map + 2<C-W>+

" alt-< or alt-> for vertical splits
map , 3<C-W>>
map . 3<C-W><


set encoding=utf-8
set cc=101


" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"make on f9
nnoremap  <F9>   :make<CR>


ino <Down> <C-O>gj
ino <Up> <C-O>gk
nno <Down> gj
nno <Up> gk

set viminfo='100,f1


set statusline="%F
set ai
set showcmd
set smartindent
set nu
set wildmenu
set tabstop=4
set shiftwidth=4
set smarttab
set ruler
set ic
set hlsearch
set ignorecase
set nocompatible
set incsearch
set nobk
set autochdir
set backspace=indent,eol,start
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
syn on

set sessionoptions=buffers

" PEP 8
au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=100
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h: match BadWhitespace /\s\+$/


let g:rainbow_active = 1

nmap <leader>u :UndotreeToggle<cr>


" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

set nowrap
set autoread
set noea
"set rnu
set expandtab
set tabstop=4

set foldmethod=indent
set nobomb " no byte order mark
"set scrolljump=8        " Scroll 8 lines at a time at bottom/top

"

"tsv colors
"let g:rcsv_colorpairs = [
    "\ ['red',     'red'],
    "\ ['blue',    'blue'],
    "\ ['green',   'green'],
    "\ ['magenta', 'magenta'],
    "\ ['NONE',        'NONE'],
    "\ ]
    "
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

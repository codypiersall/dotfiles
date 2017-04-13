set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Set mapleader to something other than below so plugins do not overwrite my
" keys.
let mapleader="s"
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'vim-scripts/SWIG-syntax'
Plugin 'vim-scripts/mako.vim'
Plugin 'embear/vim-localvimrc'
"Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'isRuslan/vim-es6'
Plugin 'scrooloose/nerdtree'
" support for Sphinx style rst files.
Plugin 'Rykka/riv.vim'

Plugin 'eparreno/vim-l9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'jamis/fuzzyfinder_textmate'
Plugin 'jamis/fuzzy_file_finder'
Plugin 'rust-lang/rust.vim'
Plugin 'lambdalisue/vim-cython-syntax'
Plugin 'justinmk/vim-syntax-extra'
"Plugin 'rhysd/committia.vim'

"Plugin 'klen/python-mode'
call vundle#end()            " required
filetype plugin indent on    " required

autocmd BufWritePre * :%s/\s\+$//e

" Treat markdown files right.
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.html setlocal shiftwidth=2 tabstop=2 textwidth=0
au BufRead,BufNewFile *.v setlocal shiftwidth=2 tabstop=2

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.

set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.

set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.

set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.

set nowrap
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.
set relativenumber  " Show relative line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.

set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.

set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.

set ignorecase      " Ignore case in search patterns.

set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.

set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).

set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.

set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode.
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)

" backspaces and cursor keys wrap too
set whichwrap+=b,s,[,]

" enable the use of a mouse
set mouse=a

inoremap jk <Esc>
filetype plugin indent on
syntax on
set ruler

set backspace=2 " Let backspace delete newlines (\n)
set splitbelow
set splitright
set hidden

set hidden

function! Bdd_()
    execute ':bp | bd #'
endfunction

command! Bd call Bdd_()

let mapleader=" "

nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>d :Bd<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>

nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>z <C-z>

nnoremap <C-TAB> :tabn<CR>
nnoremap <C-S-TAB> :tabp<CR>
nnoremap <Leader>f :FufFile **/<CR>
nnoremap <Leader>b :FufBuffer<CR>
nnoremap <Leader>t :FufTag<CR>


" These are the generated ctags for the Linux source.
set tags+=/usr/local/include/tags,~/Dev/msgpack-c/src/tags,/usr/include/tags
au BufNewFile,BufRead *.i set filetype=swig
au BufNewFile,BufRead *.sv set filetype=verilog

let mapleader=","
runtime macros/matchit.vim

function! PropertyFunction(name)
    let l = [
        \'    @property',
        \'    def ' . a:name . '(self):',
        \'        """Get and set ' . a:name . ' """',
        \'',
        \'    @' . a:name . '.setter',
        \'    def ' . a:name . '(self, value):',
        \'        pass'
    \]
    let txt = join(l, "\n")
    put =txt
endfunction

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

command! -nargs=1 Property call PropertyFunction(<q-args>)

let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
set backup
set writebackup

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_verilog_checkers = ['iverilog']

" FuzzyFinder stuff, taken from http://stackoverflow.com/a/17277011/1612701
" Truth be told, I don't remember what these do, but I must have
" found them necessary back when I installed fuzzyfinder years ago
let s:slash = '[/\\]'
let s:startname = '(^|'.s:slash.')'
let s:endname = '($|'.s:slash.')'
" directories and extensions to ignore when listing files
" these contain a lot of Python-isms, yours will probably vary
let s:extension = '\.bak|\.dll|\.exe|\.o|\.pyc|\.pyo|\.swp|\.swo|\~'
let s:dirname = 'build|deploy|dist|vms|\.bzr|\.git|\.hg|\.svn|.+\.egg-info'
let g:fuf_file_exclude = '\v'.'('.s:startname.'('.s:dirname.')'.s:endname.')|(('.s:extension.')$)'
let g:fuf_dir_exclude = '\v'.s:startname.'('.s:dirname.')'.s:endname

" limit number of displayed matches
" (makes response instant even on huge source trees)
let g:fuf_enumeratingLimit = 60
let g:SuperTabDefaultCompletionType = "<c-n>"

" YouCompleteMe options
let g:ycm_confirm_extra_conf = 0



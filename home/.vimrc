set nocompatible              " be iMproved, required
filetype off                  " required

set term=xterm
set termguicolors
let g:oceanic_material_background = 'darker'

let g:use_ale = 1

" Set mapleader to something other than below so plugins do not overwrite my
" keys.
let mapleader="s"

let g:black_linelength = 88
let g:black_skip_string_normalization = 1

let g:rustfmt_command = "rustup run stable rustfmt"

let g:tex_flavor = 'latex'

call plug#begin()
if g:use_ale
    Plug 'dense-analysis/ale'
else
    Plug 'scrooloose/syntastic'
endif

Plug 'hardcoreplayers/oceanic-material'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-tmux-navigator'
Plug 'embear/vim-localvimrc'
Plug 'eparreno/vim-l9'
" Plug 'ervandew/supertab'
Plug 'hynek/vim-python-pep8-indent'
Plug 'isRuslan/vim-es6'
Plug 'jamis/fuzzy_file_finder'
Plug 'jamis/fuzzyfinder_textmate'
Plug 'justinmk/vim-syntax-extra'
Plug 'kergoth/vim-bitbake'
Plug 'lambdalisue/vim-cython-syntax'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'Matt-Deacalion/vim-systemd-syntax'
" next two are markdown plugins
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'metakirby5/codi.vim'
Plug 'psf/black'
"Plug 'racer-rust/vim-racer'
Plug 'rhysd/committia.vim'
Plug 'rust-lang/rust.vim'
" support for Sphinx style rst files.
Plug 'Rykka/riv.vim'
Plug 'scrooloose/nerdtree'
Plug 'tweekmonster/wstrip.vim'
Plug 'Valloric/YouCompleteMe'
" Plug 'vim-scripts/Conque-GDB'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/mako.vim'
Plug 'vim-scripts/SWIG-syntax'
"Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/vim-easy-align'

Plug 'mesonbuild/meson', {'rtp': 'data/syntax-highlighting/vim'}

" snippet support
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'klen/python-mode'
call plug#end()

" Trigger config for snippets
let g:UltiSnipsExpandTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger="<S-Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<>"

"let g:ycm_key_list_previous_completion = ["<Up>"]

filetype plugin indent on    " required

" We don't need this now that we use wstrip.vim
" autocmd BufWritePre * :%s/\s\+$//e

" Treat markdown files right.
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.html setlocal shiftwidth=2 tabstop=2 textwidth=0
au BufRead,BufNewFile *.h set filetype=c
au BufRead,BufNewFile *.v,*.sv setlocal shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.sv,*.vh set filetype=systemverilog

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

set textwidth=87    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.

set formatoptions=c,l,n,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " l         long lines are not broken.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode.
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
                    " n         Wrap in numbered lists

set whichwrap+=b,s,[,] " backspaces and cursor keys wrap too

set mouse=a         " enable the use of a mouse

set wildmode=longest,list,full  "bash-like completion
set wildmenu        " tab-completion menu.

inoremap jk <Esc>
filetype plugin indent on
syntax on
set ruler

set backspace=2 " Let backspace delete newlines (\n)
set splitbelow
set splitright

set hidden

" prevents the window from being closed when :bd is used
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
nnoremap <Leader>= <C-W>=

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
" Fuzzy Finder, ripgrep, tag search
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>r :Rg<Space>
nnoremap <Leader>T :Tags<Space>

nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>e :ls<CR>:e<Space>

nnoremap <Leader>y "+yy


" These are the generated ctags for the Linux source.
set tags+=/usr/local/include/tags,~/Dev/msgpack-c/src/tags,/usr/include/tags
au BufNewFile,BufRead *.i set filetype=swig
"au BufNewFile,BufRead *.sv set filetype=verilog

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

if g:use_ale
    let g:ale_sign_column_always = 1
    let g:ale_open_list = 1
    let g:ale_lint_on_text_changed = 'never'

    let g:ale_linters = {
        \ 'python': ['flake8'],
        \ 'systemverilog': ['verilator'],
        \ 'verilog': ['verilator'],
        \ 'c': ['clangd'],
    \}
    " E501: line too long
    " W503: line break before binary operator
    let g:ale_python_flake8_options = '--ignore E501,W503'
    let g:ale_tex_chktex_options = " -n8 "
    " https://github.com/dense-analysis/ale/issues/1470
    " Remove this line when Vim 8.1 is used.
    let g:ale_echo_cursor = 0
else
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_python_python_exec = 'python'
    "let g:syntastic_verilog_checkers = ['iverilog']
    "let g:syntastic_python_checkers = []
endif


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
" autoload .ycm_extra_conf file (do not ask for confirmation)
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]


let g:wstrip_auto = 1
highlight link YcmErrorSection Error
highlight link ALEError Error

function PyFile()
    setlocal foldmethod=indent
    normal zR
endfunction

au BufNewFile,BufRead *.py call PyFile()

if has('python3')
python3 << endpy

import vim
import os.path

def get_pyproject_toml():
    """
    Search for pyproject toml from the
    """
    # https://vimhelp.org/if_pyth.txt.html#python-vim
    path = vim.current.buffer.name

    # semantically this should be a while loop, but I don't want to risk an
    # infinite loop.  That means if we're nested 1024 directories, we're going
    # to have potentially false results.  But that would be insanely nested.
    for _ in range(1024):
        # keep going up a single directory at a time until we hit the root.
        dir = os.path.dirname(path)
        if path == dir:
            # we're at the root, we got nothing.
            return None
        test_path = os.path.join(dir, 'pyproject.toml')
        if os.path.exists(test_path):
            return test_path
        else:
            path = dir
    else:
        print("OH NO INFINITE LOOP!!!", file=sys.stderr)

def run_black_if_pyproject_exists():
    toml = get_pyproject_toml()
    if toml is None:
        return
    with open(toml) as f:
        contents = f.read()
    if '[tool.black]' in contents:
        vim.command("Black")

endpy
au BufWritePre *.py execute ':python3 run_black_if_pyproject_exists()'
" end python3 part
end

" File explorer options
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4

au FileType yaml setlocal shiftwidth=2 foldmethod=indent
" Make :bn and :bp skip quickfix windows
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" search for current text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
let g:codi#width = 72

let g:rustfmt_autosave = 1

set encoding=utf-8

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

autocmd BufNewFile,BufRead, *.tex :setlocal sw=2 tw=0
" protect against modeline vunerability
set nomodeline
set modelines=0

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" disable wstrip on git commit messages: it causes syntax highlighting not to
" work in git commit -v mode.  For now we're just using committia though.
" au BufRead,BufNewFile COMMIT_EDITMSG let g:wstrip_auto = 0

" Make vim stop cluttering the working directory
" https://medium.com/@Aenon/vim-swap-backup-undo-git-2bf353caa02f
" Double-slash means to preserve path (not just filename)
set backupdir=~/.vimjunk/
set directory=~/.vimjunk/
set undodir=~/.vimjunk/

set background=dark
colorscheme oceanic_material

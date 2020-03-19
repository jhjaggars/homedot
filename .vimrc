call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-rooter'
Plug 'bling/vim-airline'
Plug 'dag/vim-fish'
Plug 'dracula/vim'
Plug 'w0rp/ale'
Plug 'elzr/vim-json'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'pearofducks/ansible-vim'
Plug 'aklt/plantuml-syntax'
" Plug 'psliwka/vim-smoothie'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rizzatti/dash.vim'
Plug 'rust-lang/rust.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-python/python-syntax'
" completions
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'wellle/tmux-complete.vim'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'michaeljsmith/vim-indent-object'

" language server client
Plug 'autozimu/LanguageClient-neovim', {
 \ 'branch': 'next',
 \ 'do': 'bash install.sh'
 \ }
call plug#end()

filetype off
filetype plugin indent on
let python_highlight_all = 1
syntax enable

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set number
set nowrap
set hidden

set termguicolors
" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox
colorscheme dracula
set background=dark
set colorcolumn=88

" moving blocks of text
vnoremap < <gv
vnoremap > >gv

set nohlsearch
set incsearch
set showmatch
set backspace=indent,eol,start
set laststatus=2
set autoindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set tabpagemax=20
set noeb
set novisualbell

set nobackup
set nowritebackup
set noswapfile
set hidden

set splitbelow
set splitright

set mouse-=a

" ctags configuration
" This will look in the local dir for a tags file first
" then fallback to common (di-common) tags and then
" finally fall back to the jdk tags
set tags=tags
set complete=k,.,w,b,u,t,i

" completion
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Makes K do the opposite of J
nmap K i<cr><esc>k$

nnoremap <SPACE> <Nop>
let mapleader = '\'

" greps for the word under the cursor
if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif
nnoremap <Leader>g :grep <cword> <CR>
nnoremap <c-j>     :cnext<CR> :norm! zz<cr>
nnoremap <c-k>     :cprev<CR> :norm! zz<cr>

" mappings to manipulate buffers
nnoremap <c-l> :bn<CR>
nnoremap <c-h> :bp<CR>
nnoremap <Leader><Leader> :bp<CR>

autocmd Filetype rest set syntax=rest
autocmd Filetype rpy set syntax=python

"Use backspace and enter to insert blank lines above and below the current
"line, respectively
nnoremap <Backspace> O<Esc>
nnoremap <CR> o<Esc>

set wildignore+=*/cover/*,*/include/*,*/lib64/*,*/lib/*,*.git,*/*.egg-info/*,*/rpm-build/*,*.gif,*.class,*.jpg,*/target/*,*.sw*,*.pyc,*/eggs/*,*/develop-eggs/*,*/parts/*,*.class,
let g:vim_json_syntax_conceal = 0

" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

set rtp+=/usr/local/opt/fzf
nnoremap <c-p> :Files<CR>

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

set signcolumn=yes
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rustup', 'run', 'stable', 'rls'],
            \ 'python': ['pyls'],
            \ 'go': ['gopls'],
            \ }

" let g:LanguageClient_virtualTextPrefix = ''
" let g:LanguageClient_useVirtualText = 0
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:ale_linters = {
            \ 'python': ['flake8', 'pyls'],
            \ }

let g:ale_fixers = {
            \ 'python': ['remove_trailing_lines', 'trim_whitespace', 'isort'],
            \ 'rust': ['rustfmt'],
            \ 'go': ['goimports'],
            \}
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '%linter% %code:%%s'

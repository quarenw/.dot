" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" Remap to get out of insert and visual mode without esc
inoremap jf <esc>
vnoremap jf <esc>

" Remap to get into command mode without using shift
nnoremap ; :
vnoremap ; :

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" allow the cursor to go anywhere in visual block mode
set virtualedit+=block

colorscheme monokai

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>



call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"Lightline
Plug 'itchyny/lightline.vim'

"NERDTree
Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Show Git changes
Plug 'airblade/vim-gitgutter'
let g:gitgutter_async=0
let g:gitgutter_max_signs = 2000

"Git wrapper
Plug 'tpope/vim-fugitive'

"Paste easy with (set number)
Plug 'roxma/vim-paste-easy'

" Ale
let g:ale_completion_enabled = 1
Plug 'w0rp/ale'
let g:ale_fixers = ['eslint'] 
set omnifunc=ale#completion#OmniFunc
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
highlight ALEError ctermbg=none cterm=underline 
highlight ALEWarning ctermbg=none cterm=underline
let g:ale_fix_on_save = 1

" Ale on Lightline
Plug 'maximbaz/lightline-ale'
let g:lightline = {}

let g:lightline.component_expand = {
            \  'linter_checking': 'lightline#ale#checking',
            \  'linter_warnings': 'lightline#ale#warnings',
            \  'linter_errors': 'lightline#ale#errors',
            \  'linter_ok': 'lightline#ale#ok',
            \ }

let g:lightline.component_type = {
            \     'linter_checking': 'left',
            \     'linter_warnings': 'warning',
            \     'linter_errors': 'error',
            \     'linter_ok': 'left',
            \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

" Conquest of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" One Dark Colorscheme
Plug 'joshdick/onedark.vim'
let g:onedark_hide_endofbuffer = 1

" Syntax highlighting for JS
Plug 'pangloss/vim-javascript'

" Auto-pair brackets/quotes/etc
Plug 'jiangmiao/auto-pairs'

" Initialize plugin system
call plug#end()

syntax on
colorscheme onedark
set laststatus=2
set noshowmode
set number

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

colorscheme Excelsior
syntax on

" awesome trick by github.com/rson
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

source ~/.vim/conf/bundles.vim

let mapleader = ","

set gfn=Menlo:h12
set gfn=Menlo\ for\ Powerline:h12
let g:Powerline_symbols = 'fancy'

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:ctrlp_by_filename = 1
let g:ctrlp_open_new_file = 1
let g:ctrlp_open_multi = '1t'
let g:ctrlp_follow_symlinks = 1

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>']
  \ }

"let g:ctrlp_working_path_mode = 1 set working dir to parent dir of cur file
map <leader>f :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

" objective-c
let g:alternateExtensions_m = "h"
let g:alternateExtensions_h = "m"

let g:delimitMate_expand_cr = 1

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

set paste

set backup
set backupdir=~/.vim/backups
set directory=~/.vim/tmp
set undodir=~/.vim/undo
set tags=./tags;
let g:easytags_dynamic_files = 1
"let g:easytags_file = '~/.vim/tags'

cmap w!! %!sudo tee > /dev/null %

nnoremap <silent> <Leader>l :TlistToggle<CR>
map <Leader><CR> o<Esc>ko
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
set laststatus=2
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set gcr+=a:blinkon0
set undofile

filetype plugin indent on
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.zsh-theme set filetype=zsh

set wildmenu
set wildmode=list:longest

set encoding=utf-8
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set relativenumber

"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

set wrap

set list
set listchars=tab:▸\ ,eol:¬

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

nnoremap <leader>a :Ack 

inoremap jj <ESC>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <C-l> :noh<CR><C-l>

nnoremap <leader>p :set rnu! list!<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

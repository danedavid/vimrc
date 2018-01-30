" Pathogen
execute pathogen#infect()

" Double i to exit Insert mode
inoremap ii <Esc>

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" Syntax Highlighting
syntax on

" JSX highlighting
let g:jsx_ext_required=0

" Status Line - lightline
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Filetype Plugins
filetype plugin indent on

" Color Scheme
colorscheme onedark

" Mappings
let mapleader=","
nmap <leader>w :w<CR>
nmap <leader>q :q!<CR>
nmap <leader>x :x<CR>


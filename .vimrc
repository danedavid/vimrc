" Pathogen
execute pathogen#infect()

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
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['gitbranch', 'readonly', 'filename', 'modified']
  \   ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ }, 
  \}

" Filetype Plugins
filetype plugin indent on

" Auto-commands
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Color Scheme
colorscheme onedark

" Mappings
let mapleader=","
nmap <leader>w :w<CR>
nmap <leader>q :q!<CR>
nmap <leader>x :x<CR>
inoremap ii <Esc>
inoremap <C-[> <Del>
nnoremap ]] /}<CR>
nnoremap ff vey/<C-r>"<CR>
nnoremap Y "+y
nnoremap gd :Gdiff<CR>
nnoremap U <C-r>
nnoremap <tab> gt
nnoremap 9j 20j
nnoremap 9k 20k

" GitGutter
let g:gitgutter_map_keys=0

" close-tags
let g:closetag_filenames='*.jsx,*.xhtml,*.js'

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules, .git',
  \ 'file': '*.swp'
  \}
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("t")': ['<CR>'],
  \ 'AcceptSelection("e")': ['<C-t>']
  \}

" Misc
set number
set updatetime=500
set nofixendofline
set incsearch
set cul

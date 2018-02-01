" Pathogen
execute pathogen#infect()

" Indentation
set expandtab "Use soft tabs (spaces)
set shiftwidth=2 "Set tab width = 2
set softtabstop=2 "Set tab width = 2

" Syntax Highlighting
syntax on

" JSX highlighting
let g:jsx_ext_required=0 "Use JSX syntax for .js files

" Status Line - lightline
set laststatus=2 "Show Status Line
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
  \} "Config for lightline

" Filetype Plugins
filetype plugin indent on "Use Plugins and Indentation based on FileType

" Auto-commands
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "Disable automatic comment insertion

" Color Scheme
colorscheme onedark "Atom's colorscheme

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
let g:gitgutter_map_keys=0 "Remove all keymaps by vim-gitgutter

" close-tags
let g:closetag_filenames='*.jsx,*.xhtml,*.js' "Files for which automatic close tags required

" CtrlP
let g:ctrlp_show_hidden = 1 "Show hidden files in CtrlP menu
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules, .git',
  \ 'file': '*.swp'
  \} "Files to skip in CtrlP menu
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("t")': ['<CR>'],
  \ 'AcceptSelection("e")': ['<C-t>']
  \} "Remap keys to default open in new tab

" Misc
set number "Show Line numbers
set updatetime=500 "Reduced updatetime to show realtime git diff
set nofixendofline "Do not add new line at end of file
set incsearch "Incremental Search
set cul "Highlight current line

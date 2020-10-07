" Pathogen
execute pathogen#infect()

" Indentation
set expandtab "Use soft tabs (spaces)
set shiftwidth=2 "Set tab width = 2
set softtabstop=2 "Set tab width = 2
set autoindent "Set indent of previous line

" Syntax Highlighting
syntax on

" JSX highlighting
let g:jsx_ext_required=0 "Use JSX syntax for .js files

" Status Line - lightline
set laststatus=2 "Show Status Line
let g:lightline = {
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

" Tab line
let g:lightline.tab_component_function = {
      \ 'custom_tabname': 'CustomTabname',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'lightline#tab#tabnum'
      \ }

let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'custom_tabname', 'modified' ],
      \ 'inactive': [ 'tabnum', 'custom_tabname', 'modified' ] }

" Filetype Plugins
filetype plugin indent on "Use Plugins and Indentation based on FileType

" Auto-commands
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "Disable automatic comment insertion

" Mappings
let mapleader=","
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>Q :q!<CR>
nmap <leader>x :x<CR>
inoremap ii <Esc>
inoremap <C-[> <Del>
nnoremap ]] /}<CR>
nnoremap Y "+y
vnoremap Y "+y
nnoremap U <C-r>
nnoremap <tab> gt
nnoremap 9j 20j
nnoremap 9k 20k
nnoremap ; A;<Esc>
nnoremap D "_d
vnoremap D "_d
nnoremap gd :Gdiff<CR>
nnoremap gs :Gstatus<CR>
nnoremap <leader>a :Ack!<Space>
nnoremap <leader>v :tabnew ~/.vim/.vimrc<CR>
nnoremap <leader>m <C-w>w
nnoremap <leader>p "+p
nnoremap gf <C-w>gf

" GitGutter
let g:gitgutter_map_keys=0 "Remove all keymaps by vim-gitgutter

" close-tags
let g:closetag_filenames='*.jsx,*.xhtml,*.js, *.html' "Files for which automatic close tags required

" CtrlP
let g:ctrlp_show_hidden = 1 "Show hidden files in CtrlP menu
let g:ctrlp_open_new_file = 't' "Open new files in new tab
let g:ctrlp_max_files = 0 " No limit for max files
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|.git|tmp)[\/]',
  \ 'file': '\v\.(exe|so|dll|mp3|svg|jpg|png|chunk\.js|gz|br|map|bundle\.js|cache)$',
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
set noswapfile "No swap file created
set modifiable "NERDTree can modify the tree
set wildignore+=*/.git/*,*/node_modules
set ignorecase "Ignore case while searching
set smartcase "Ignore case only if all are lowercase characters
if &diff
    set diffopt-=internal
    set diffopt+=vertical
endif

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>n :call MapKeyN()<CR>
let NERDTreeShowHidden=1

" Custom functions
function! CustomTabname(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnum = buflist[winnr - 1]
  let bufname = expand('#'.bufnum.':t')
  let buffullname = expand('#'.bufnum.':p')
  let buffullnames = []
  let bufnames = []
  for i in range(1, tabpagenr('$'))
    if i != a:n
      let num = tabpagebuflist(i)[tabpagewinnr(i) - 1]
      call add(buffullnames, expand('#' . num . ':p'))
      call add(bufnames, expand('#' . num . ':t'))
    endif
  endfor
  let i = index(bufnames, bufname)
  if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
    return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
  else
    return strlen(bufname) ? bufname : '[No Name]'
  endif
endfunction

function! IsNerdTreeEnabled()
  return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

function! MapKeyN()
  if IsNerdTreeEnabled()
    execute "NERDTreeToggle"
  else
    execute "NERDTreeFind"
  endif
endfunction

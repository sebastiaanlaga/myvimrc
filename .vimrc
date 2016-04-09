" Include Vim-Plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
   silent !mkdir -p ~/.vim/autoload
   silent !curl -fLo ~/.vim/autoload/plug.vim
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall
endif
" }}}


call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/VisIncr'
Plug 'bling/vim-airline'
Plug 'ludovicchabant/vim-lawrencium'

call plug#end()

"Plug 'nachumk/systemverilog.vim'  
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'


" Tabs
set tabstop=3
set shiftwidth=3
set expandtab

"No swapfiles
set noswapfile

"Visula
set number 
set relativenumber
set ruler
syntax enable
set title
set scrolloff=4 "Stay 4 lines from top/bottom
set wrap!

"Visual remove stuff
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=R  "remove right-hand scroll bar on split
set guioptions-=l  "remove left-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar on split

"Searching
set magic      " Use magic regexes
set hlsearch   " Highlight all matches
set ignorecase " Ignore case when searching
set smartcase  " Be case sensitive if at least one uppercase char is used
set gdefault   " Default substitute all matches on a line

set history=100          " Set history 100
set wildmenu         " Command completion
set wildmode=full    " Complete to fullest match
set ttyfast          " Use a fast terminal
set lazyredraw       " No need to redraw constantly
set ttimeoutlen=10   " Set the timeout to a minimum
set diffopt+=iwhite  " Ignore spaces in diffs"

"Backspace needs to work always
set backspace=indent,eol,start

"Always copy to clipboard
set clipboard=unnamedplus


"Buffering
:nnoremap <F2> :Explore<CR>
:nnoremap <F5> :bp<CR>
:nnoremap <F6> :buffers<CR>:buffer<Space>
:nnoremap <F7> :bn<CR>

let mapleader = ","
let no_buffers_menu = 1

nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>k :sp<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>j :sp<CR>:exec("tag ".expand("<cword>"))<CR>f(vf)yy:qp

"function! DelTagOfFile(file)
"   let fullpath = a:file
"   let cwd = getcwd()
"   let tagfilename = cwd . "/tags"
"   let f = substitute(fullpath, cwd . "/", "", "")
"   let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
"   let resp = system(cmd)
"   echo cmd 
"endfunction
"
"function! UpdateTags()
"  let f = expand("%:p")
"  let cwd = getcwd()
"  let filename = substitute(f, cwd . "/", "", "")
"  let tagfilename = cwd . "/tags"
"  let cmd = 'ctags --languages=systemverilog -f tags -a ' . filename . ''
"  call DelTagOfFile(f)
"  let resp = system(cmd)
"  echo cmd
"endfunction
"
"function! BuildTags()
"   let cmd = 'ctags --languages=systemverilog -f tags -R verification/sv/ dependencies/verif_common/ test/ &'
"   let resp = system(cmd)
"endfunction 

if has('gui_running')
   syntax enable
   set background=dark
   colorscheme solarized 

   let g:airline#extensions#tabline#enabled = 1
endif

autocmd BufWritePost *.sv,*.v call UpdateTags()


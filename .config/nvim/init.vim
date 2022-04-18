" the basics
set encoding=utf-8      " set encoding to UTF-8, default is latin1
set number              " show line numbers
set wrap                " wrap lines
colorscheme ron         " colorscheme ron

" tab settings
set tabstop=2           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=2        " number of spaces to use for each step of (auto)indent
set softtabstop=2       " backspace after pressing <TAB> will remove up to this many spaces
set autoindent          " auto indent for quality of life

" search features
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" filetypes for coreos
au BufRead,BufNewFile *.ign set filetype=json
au BufRead,BufNewFile *.btn set filetype=yaml

" install plug if not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" begin plugins
call plug#begin(~/.local/share/nvim/plugged/)

" NERDtree https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'
noremap <C-n> :NERDTreeToggle<CR>
noremap! <C-n> :NERDTreeToggle<CR>
" start NERDTree
autocmd VimEnter * NERDTree



" end plugins
call plug#end()

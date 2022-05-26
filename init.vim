set nocompatible 		" disable compatibility with old time vi
set showmatch			" show matching brackets
set hlsearch			" highlight search results

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab

filetype plugin indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
syntax on
"set cc=80
"set wildmode=longest,list	" bash style tab completion
set number

"" Key remappings

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-w>h
inoremap <A-j> <C-w>j
inoremap <A-k> <C-w>k
inoremap <A-l> <C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"" PLUGINS

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'
Plug 'navarasu/onedark.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


lua <<EOF

require('onedark').setup {
    style = 'darker',
    transparent = true
}
require('onedark').load()

require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    -- indent = {enable = true} -- this line causes commenting to break for some reason
    -- local lsp = require "lspconfig"
    -- local coq = require "coq"
}
EOF

set nocompatible 		" disable compatibility with old time vi
set showmatch			" show matching brackets
set hlsearch			" highlight search results

set tabstop=2
set softtabstop=2
set shiftwidth=2
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
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


" for resizing
" designed to let Alt+Shift +/-/</> do the resizing
nnoremap <A-+> <C-w>+
nnoremap <A-_> <C-w>-
nnoremap <A-<> <C-w><
nnoremap <A->> <C-w>>


" for tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" for search and replace
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

" For lsp
Plug 'neovim/nvim-lspconfig'

" telescope.nvim begin
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" coq
Plug 'ms-jpq/coq_nvim'

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" telescope stuff ends

" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


lua <<EOF
local lsp = require "lspconfig"
local coq = require "coq"


require('onedark').setup {
    style = 'darker',
    transparent = true
}
require('onedark').load()

require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    -- indent = {enable = true} -- this line causes commenting to break for some reason
}

EOF

set nocompatible 		" disable compatibility with old time vi
set showmatch			" show matching brackets
set hlsearch			" highlight search results
set mouse=

set nofixendofline
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

" tnoremap <A-h> <C-\><C-N><C-w>h
" tnoremap <A-j> <C-\><C-N><C-w>j
" tnoremap <A-k> <C-\><C-N><C-w>k
" tnoremap <A-l> <C-\><C-N><C-w>l
" inoremap <A-h> <C-w>h
" inoremap <A-j> <C-w>j
" inoremap <A-k> <C-w>k
" inoremap <A-l> <C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

" For hex editing
" Hex read
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>
" Hex write
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

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
"Plug 'navarasu/onedark.nvim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" For lsp
Plug 'neovim/nvim-lspconfig'

" telescope.nvim begin
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" for fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" coq
Plug 'ms-jpq/coq_nvim'

"
Plug 'folke/tokyonight.nvim'

" lualine
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'

" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" telescope stuff ends

" tmux
Plug 'aserowy/tmux.nvim'

" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:fzf_layout = { 'down': '~40%' }

lua <<EOF
local lsp = require "lspconfig"
local coq = require "coq"


require('tokyonight').setup {
    -- style = 'darker',
    transparent = true
}
require('tokyonight').load()

require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    -- indent = {enable = true} -- this line causes commenting to break for some reason
}

require('lualine').setup({
  options = {
    theme = 'tokyonight',
  },
})

require('tmux').setup({
    navigation = {
        -- cycles to opposite pane while navigating into the border
        cycle_navigation = false,

        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = false,

        -- prevents unzoom tmux when navigating beyond vim border
        persist_zoom = false,
    },
    resize = {
        -- enables default keybindings (A-hjkl) for normal mode
        enable_default_keybindings = false,

        -- sets resize steps for x axis
        resize_step_x = 1,

        -- sets resize steps for y axis
        resize_step_y = 1,
    }

})

local map = vim.api.nvim_set_keymap
local opts = {noremap=true, silent=true}
-- navigation
map('n', '<M-h>', '<cmd>lua require("tmux").move_left()<cr>', opts)
map('n', '<M-j>', '<cmd>lua require("tmux").move_bottom()<cr>', opts)
map('n', '<M-k>', '<cmd>lua require("tmux").move_top()<cr>', opts)
map('n', '<M-l>', '<cmd>lua require("tmux").move_right()<cr>', opts)
map('t', '<M-h>', '<cmd>lua require("tmux").move_left()<cr>', opts)
map('t', '<M-j>', '<cmd>lua require("tmux").move_bottom()<cr>', opts)
map('t', '<M-k>', '<cmd>lua require("tmux").move_top()<cr>', opts)
map('t', '<M-l>', '<cmd>lua require("tmux").move_right()<cr>', opts)
-- resizing
map('n', '<M-H>', '<cmd>lua require("tmux").resize_left()<cr>', opts)
map('n', '<M-J>', '<cmd>lua require("tmux").resize_bottom()<cr>', opts)
map('n', '<M-K>', '<cmd>lua require("tmux").resize_top()<cr>', opts)
map('n', '<M-L>', '<cmd>lua require("tmux").resize_right()<cr>', opts)
map('t', '<M-H>', '<cmd>lua require("tmux").resize_left()<cr>', opts)
map('t', '<M-J>', '<cmd>lua require("tmux").resize_bottom()<cr>', opts)
map('t', '<M-K>', '<cmd>lua require("tmux").resize_top()<cr>', opts)
map('t', '<M-L>', '<cmd>lua require("tmux").resize_right()<cr>', opts)

EOF

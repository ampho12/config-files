vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set mouse=")
vim.g.mapleader = " "
-- vim.g.background = "light"

vim.opt.clipboard = "unnamedplus"


vim.opt.swapfile = false

-- Navigate vim panes better
-- vim.keymap.set('n', '<M-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<M-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<M-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<M-l>', ':wincmd l<CR>')
-- vim.keymap.set('i', '<M-k>', '<Esc>:wincmd k<CR>')
-- vim.keymap.set('i', '<M-j>', '<Esc>:wincmd j<CR>')
-- vim.keymap.set('i', '<M-h>', '<Esc>:wincmd h<CR>')
-- vim.keymap.set('i', '<M-l>', '<Esc>:wincmd l<CR>')

-- Tab navigation mappings
vim.keymap.set('n', 'th', ':tabfirst<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tk', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tj', ':tabprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tl', ':tablast<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tt', ':tabedit ', { noremap = true })
vim.keymap.set('n', 'tn', ':tabnext ', { noremap = true })
vim.keymap.set('n', 'tm', ':tabm ', { noremap = true })
vim.keymap.set('n', 'td', ':tabclose<CR>', { noremap = true, silent = true })


vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.wo.number = true
vim.o.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.o.undofile = true






-- set encoding=utf-8
-- " Persistent undo
-- " set undodir=~/.config/nvim/undo-dir
-- set undolevels=1000
-- set undoreload=10000
-- set undofile
-- set noswapfile
-- set nobackup
-- set nohlsearch
-- set hidden
-- set clipboard+=unnamedplus
-- set wildmode=longest,list,full
-- set background=dark
-- set tabstop=4 shiftwidth=4 softtabstop=4
-- set smartindent
-- set expandtab
-- set exrc
-- set hidden
-- set noerrorbells
-- set scrolloff=8
-- set signcolumn=yes

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set terminal title to filename
vim.o.title = true

-- Set highlight on search
vim.o.hlsearch = false

-- Set incremental search
vim.o.incsearch = true

-- Ignore case when seearching
vim.o.ignorecase = true

-- Apply case when searching with uppercase characters
vim.o.smartcase = true

-- Set scrolloff to 8 lines
vim.o.scrolloff = 8

-- Make line numbers default
vim.wo.number = true

-- Make line numbers relative
vim.wo.relativenumber = true

-- Set clipboard provider
vim.o.clipboard = 'unnamedplus'

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


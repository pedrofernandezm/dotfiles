-- SETTINGS
local g = vim.g
local o = vim.o

vim.api.nvim_command('filetype plugin indent on')

o.termguicolors = true
-- o.background = 'dark'

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 5
o.background = 'dark'
o.encoding = 'utf-8'
g.airline_theme = 'catppuccin'
-- o.relativenumber = true
-- o.signcolumn = 'yes:2'
o.cursorline = false

-- Better editing experience
o.expandtab = true
-- o.smarttab = true
o.cindent = true
-- o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2 -- If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Better search behavior
-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
o.jumpoptions = 'view'

-- Stable buffer content on window open/close events.
o.splitkeep = 'screen'

-- Improve diff
vim.opt.diffopt:append('linematch:60')

-- WARN: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1

-- Map <leader> to ,
g.mapleader = ','
-- g.maplocalleader = ','

-- PLUGINS
require('packer').startup({
    function(use)
        use('wbthomason/packer.nvim') -- Package Manager
        use('sheerun/vim-polyglot') -- A solid language pack for Vim.
        use('tpope/vim-rails') -- lugin for working with Ruby on Rails applications
        use('isRuslan/vim-es6') -- Write JavaScript ES6 easily with vim
        use('AndrewRadev/splitjoin.vim') -- Conversion of multiline of codes into one-liners and visceversa (3)
        use('duff/vim-bufonly') -- Delete all the buffers except the current buffer. (2)
        use('ervandew/supertab') -- Allows you to use <Tab> for all your insert completion needs (5)
        use('godlygeek/tabular') -- Allows you to filter and align text (4.5)
        use('mileszs/ack.vim') -- search tool from Vim (4)
        use('tpope/vim-abolish') -- Allows you to abbreviate and replace multiple variants of a word (3)
        use('tpope/vim-commentary') -- Allows you to comment stuff (5)
        use('tpope/vim-endwise') -- Allows you to autocomplete chunks of code, adds 'end' in functions, if, etc. (4)
        use('tpope/vim-eunuch') -- Provides you some shell commands out-of-the-box (2)
        use('tpope/vim-fugitive') -- A git wrapper for vim, provides you some git commands out-of-the-box.(4.5)
        use('tpope/vim-ragtag') -- Allows you to map HTML, XML, PHP, ASP, eRuby, JSP among others.
        use('tpope/vim-repeat') -- Allows you to repeat supported plugin maps with '.'
        use('tpope/vim-rsi') -- Key bindigns in insert and command-line modes.
        use('tpope/vim-sensible') -- Provides some default settings for vim
        use('tpope/vim-surround') -- Allows you to surron words with brackets, quotes, html tags, among others.
        use('tpope/vim-unimpaired') -- pairs of handy bracket mappings
        use('tpope/vim-vinegar') -- an enhancement for netrw (2)
        use('vim-scripts/bufkill.vim') -- Allows you to perfomr operations over buffers (unload/delete/wipe)
        use('vim-scripts/bufexplorer.zip') -- Allows you to switch between buffers and perform another commands as well
        use('jgdavey/tslime.vim') -- Allows you to send commands from vim to a running tmux session
        use('rondale-sc/vim-spacejam') -- Plugin for auto removing whitespace
        use('tpope/vim-dispatch') -- Allows you to kick off builds and test suites using one of several asynchronous adapters (including tmux, screen, iTerm, Windows, and a headless mode), and when the job completes, errors will be loaded and parsed automatically
        use('milkypostman/vim-togglelist') -- allows you to bind a key to toggle the Location List and the Quickfix List
        use('christoomey/vim-tmux-navigator') -- Provides you easy navigation between tmux panes and vim splits
        use('vim-scripts/IndexedSearch') -- Displays 'Nth match out of M' at every search
        use('kana/vim-textobj-user') -- Allows you to create your own text objects
        use('Rykka/lastbuf.vim') -- Allows you to open last closed buffer
        use('ctrlpvim/ctrlp.vim') -- Fuzzy file, buffer, mru, tag, etc finder
        use('scrooloose/nerdtree') -- A tree explorer plugin for vim
        use('vim-airline/vim-airline') -- Lean & mean status/tabline for vim that's light as air.
        use('ekalinin/Dockerfile.vim') -- Vim syntax file for Docker's Dockerfile and snippets for snipMate.
        -- use('tpope/vim-rails') -- Plug for working with Ruby on Rails applications
        -- use('isRuslan/vim-es6') -- Write JavaScript ES6 easily with vim
        use('ntpeters/vim-better-whitespace') -- causes all trailing whitespace characters to be highlighted.
        use('mattn/emmet-vim') --emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
        use('dense-analysis/ale') --ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim
        use('editorconfig/editorconfig-vim') -- EditorConfig plugin for Vim
        use('ryanoasis/vim-devicons') -- Adds filetype glyphs (icons) to various vim plugins
        use { "catppuccin/nvim", as = "catppuccin" }
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})

-- KEY BINDINGS
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Map window prefix to ommit W
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-h>', '<C-W>h')
map('n', '<C-l>', '<C-W>l')

-- vim tab navigation
map('n', 'th', ':tabfirst<CR>')
map('n', 'tj', ':tabprev<CR>')
map('n', 'tk', ':tabnext<CR>')
map('n', 'tl', ':tablast<CR>')
map('n', 'tc', ':tabclose<CR>')
map('n', 'tn', ':tabnew<CR>')

--" NERDTree configuration
-- local NERDTreeIgnore=['\~$', 'tmp', '\.git', '\.bundle', '.DS_Store', 'tags', '.swp']
-- local NERDTreeShowHidden=1
-- local g:NERDTreeDirArrows=0
map('n', '<Leader>n', ':NERDTreeToggle<CR>')
map('n', '<Leader>fnt', ':NERDTreeFind<CR>')

-- Unhighlight search results
map('n', '<Leader><space>', ':nohl<CR>')

vim.g.catppuccin_flavour = 'mocha'
-- latte (light)
-- frappe (dark)
-- macchiato (darker)
-- mocha (darkest)

require('catppuccin').setup({
  term_colors = true,
  transparent_background = false,
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.15,
  },
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = { 'italic' },
    operators = {},
  },
  integrations = {
    treesitter = true,
    treesitter_context = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'undercurl' },
        hints = { 'undercurl' },
        warnings = { 'undercurl' },
        information = { 'undercurl' },
      },
    },
    -- coc_nvim = false,
    lsp_trouble = true,
    cmp = true,
    lsp_saga = true,
    -- gitgutter = false,
    gitsigns = true,
    -- leap = false,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    -- neotree = {
    --   enabled = false,
    --   show_root = true,
    --   transparent_panel = false,
    -- },
    -- dap = {
    --   enabled = false,
    --   enable_ui = false,
    -- },
    fidget = true,
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    -- dashboard = true,
    -- neogit = false,
    -- vim_sneak = false,
    -- fern = false,
    -- barbar = false,
    bufferline = true,
    markdown = true,
    -- lightspeed = false,
    -- ts_rainbow = false,
    -- hop = false,
    notify = true,
    -- telekasten = true,
    symbols_outline = true,
    mini = true,
    -- aerial = false,
    -- vimwiki = true,
    -- beacon = true,
    -- navic = false,
    -- overseer = false,
  },
})
vim.cmd([[colorscheme catppuccin]])

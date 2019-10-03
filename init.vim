" Be iMproved
set nocompatible

let g:ale_completion_enabled = 0

" ALE - some of the options need to be defined before ALE is initialized
let g:ale_echo_cursor = 1
let g:ale_close_preview_on_insert = 1
let g:ale_set_balloons = 1
let g:ale_sign_column_always = 1
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'html': ['prettier'],
      \   'javascript': ['eslint'],
      \   'json': ['prettier'],
      \   'scss': ['stylelint'],
      \   'ruby': ['rubocop'],
      \   'php': ['php_cs_fixer'],
      \   'python': ['black'],
      \}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let b:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_linters = {
      \ 'ruby': ['solargraph', 'ruby', 'rubocop'],
      \ 'python': ['pyls', 'bandit', 'flake8', 'mypy', 'pylint']
      \}


" vim-plug start
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'scrooloose/nerdtree'
Plug 'rhysd/conflict-marker.vim'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'
Plug 'sheerun/vim-polyglot'
Plug 'janko-m/vim-test'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-endwise' " disabled because it conflicts with Coc autocomplete
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'google/vim-searchindex'
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rails'
Plug 'sainnhe/gruvbox-material'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'tpope/vim-repeat'

" COC extensions, these needs to be installed manually
" Plug 'neoclide/coc-json'
" Plug 'neoclide/coc-css'
" Plug 'neoclide/coc-html'
" Plug 'marlonfan/coc-phpls'
" Plug 'neoclide/coc-solargraph'
" Plug 'neoclide/coc-yaml'
" Plug 'neoclide/coc-python'
" Plug 'neoclide/coc-highlight'

" Initialize plugin system
call plug#end()

" Required:
filetype plugin indent on
syntax enable

" Open new buffers bellow and right
set splitright
set splitbelow

" Allow send buffers to the background
set hidden

" Add comma as leader
:nmap , \

" Display line numbers
set number

" vim tab navigation
nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<CR>

" disable arrow navigation keys
inoremap  <Up>    <NOP>
inoremap  <Down>  <NOP>
inoremap  <Left>  <NOP>
inoremap  <Right> <NOP>
noremap   <Up>    <NOP>
noremap   <Down>  <NOP>
noremap   <Left>  <NOP>
noremap   <Right> <NOP>

" do not automatically wrap on load
set nowrap
" do not automatically wrap text when typing
set formatoptions-=t

" Better search behavior
set hlsearch " Keep matches highlighted
set incsearch " Highlight while searching with / or ?
set ignorecase
set smartcase

set autoindent

" Make backspace work as you would expect
set backspace=indent,eol,start

set smarttab

" Menu for autocomplete for command line completion
set wildmenu
set wildmode=longest:full,full

" autocomplete options
set completeopt=noinsert,menuone,noselect

" force the status line and tab line to always display
set laststatus=2

" Unhighlight search results
map <Leader><space> :nohl<cr>

" Don't scroll off the edge of the page
set scrolloff=5

" Set default indentation to 2 spaces
set softtabstop=2 shiftwidth=2 expandtab

" Set line width to 80
set textwidth=80

" Disable vim backups
set nobackup

" Disable swapfile
set noswapfile

" allows per-project configuration files
set exrc

" Show non-printable characters
set list
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars='tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars='tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Display vertical column at 80 characters
set colorcolumn=+1
highlight ColorColumn ctermbg=8

" Show already typed keys when more are expected
set showcmd

" Terminal True Color Support
set termguicolors

" mode information is displayed in the statusline (lightline)
set noshowmode

" Theme
" let g:challenger_deep_termcolors = 16
" let g:challenger_deep_terminal_italics = 1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark=1
set background=dark
colorscheme gruvbox-material
" colorscheme challenger_deep

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <Tab> and <S-Tab> to navigate the completion list:<Paste>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" coc.nvim uses jsonc as configuration file format, highlight comments
autocmd FileType json syntax match Comment +\/\/.\+$+

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K (uppercase) to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" enable highlight current symbol on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"
" COC - End

" NerdTree
let NERDTreeIgnore=['\~$', 'tmp', '\.git\', '\.bundle', '.DS_Store', 'tags', '.swp', '\.pyc$', '^__pycache__$']
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=1
map <Leader>n :NERDTreeToggle<CR>
map <Leader>fnt :NERDTreeFind<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
      \ },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ }
      \ }
" Lightline <> ALE Integration
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \  'linter_checking': 'left',
      \  'linter_warnings': 'warning',
      \  'linter_errors': 'error',
      \  'linter_ok': 'left',
      \ }

" navigate between errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
" Lightline - End

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'pyc|__pycache__|node_modules\|DS_Store\|git'

" Ack.vim
" use Ack! by default
cnoreabbrev Ack Ack!
if executable('ag')
  " use the_silver_searcher if available
  let g:ackprg = 'ag --vimgrep'
endif
" search for the word under the cursor
nnoremap <leader><bs> :Ack! '\b<c-r><c-w>\b'<cr>

" vim-test
let test#strategy = "dispatch"
" t Ctrl+n
nmap <silent> t<C-n> :TestNearest<CR>
" t Ctrl+f
nmap <silent> t<C-f> :TestFile<CR>
" t Ctrl+s
nmap <silent> t<C-s> :TestSuite<CR>
" t Ctrl+l
nmap <silent> t<C-l> :TestLast<CR>
" t Ctrl+g
nmap <silent> t<C-g> :TestVisit<CR>

" Spell check for Markdown and Git commit messages
autocmd FileType markdown,gitcommit setlocal spell

" Map window prefix to ommit W
" this seems to be not needed since we are using vim-tmux-navigator plugin
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" fzf.vim
nnoremap <C-P> :FZF<cr>

" Pretty print JSON
nnoremap <Leader>j :%!python -m json.tool<CR>

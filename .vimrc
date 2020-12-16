" Highlight default syntax
syntax on

" ALE initialization options
let g:ale_completion_enabled = 1
" let g:deoplete#enable_at_startup = 1

call plug#begin('~/.vim/bundle')
source ~/.vim/bundles.vim
if filereadable(expand('~/.vim/bundles.vim.local'))
  source ~/.vim/bundles.vim.local
endif
call plug#end()

" Allow set indent per filetype
filetype plugin indent on

" Visual notification
set visualbell

"use system clipboard
" set clipboard+=unnamed

" Menu for autocomplete for a path
set wildmenu
set wildmode=list:longest,full

" Open new buffers bellow and right
set splitright
set splitbelow

" Allow send buffers to the background
set hidden

" GUI options
set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r

" Display line numbers
set number

" Use bash when executing shell commands
set shell=bash

" Set columns, lines and line numbers
augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=81 lines=70 number
augroup END

" Add comma as leader
:nmap , \

" Map window prefix to ommit W
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

" Better search behavior
set hlsearch " Keep matches highlighted
set incsearch " Highlight while searching with / or ?
set ignorecase
set smartcase

" Unhighlight search results
map <Leader><space> :nohl<cr>

" Don't scroll off the edge of the page
set scrolloff=5

" This uses Ack.vim to search for the word under the cursor
nnoremap <leader><bs> :Ag! '\b<c-r><c-w>\b'<cr>

" NERDTree configuration
let NERDTreeIgnore=['\~$', 'tmp', '\.git\', '\.bundle', '.DS_Store', 'tags', '.swp']
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=0
map <Leader>n :NERDTreeToggle<CR>
map <Leader>fnt :NERDTreeFind<CR>

" Set default indentation to 2 spaces
set softtabstop=2 shiftwidth=2 expandtab

" Set line width to 200 characters, must be 80
set textwidth=200

" hi Search gui=bold term=bold,underline cterm=NONE guibg=Grey40 ctermbg=Yellow ctermfg=Black

" vp doesn't replace paste buffer
" function! RestoreRegister()
"   let @" = s:restore_reg
"   return ''
" endfunction
" function! s:Repl()
"   let s:restore_reg = @"
"   return "p@=RestoreRegister()\<cr>"
" endfunction
" vmap <silent> <expr> p <sid>Repl()

" ctrlp.vim config
" if get(g:, 'loaded_ctrlp', 1)
"   let g:ctrlp_match_window_reversed = 0
"   let g:ctrlp_working_path_mode = 'a'
"   let g:ctrlp_max_height = 20
"   let g:ctrlp_match_window_bottom = 0
"   let g:ctrlp_switch_buffer = 0
"   let g:ctrlp_custom_ignore = '\v.DS_Store|.sass-cache|.scssc|tmp|.bundle|.git|node_modules|vendor|bower_components$'
" endif
" Use Ag over Grep
" set grepprg=ag\ --nogroup\ --nocolor


" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" let g:fruzzy#usenative = 1
" tell CtrlP to use this matcher
" let g:ctrlp_match_func = {'match': 'fruzzy#ctrlp#matcher'}
" let g:ctrlp_match_current_file = 1 " to include current file in matches

" fzf.vim
nnoremap <C-P> :FZF<cr>

" Disable vim backups
set nobackup

" Disable swapfile
set noswapfile

" The encoding displayed
set encoding=utf-8

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

" Find the current line quickly
set cursorline

"lazy redraw for macors
" set lazyredraw

" Show already typed keys when more are expected
set showcmd

" Make backspace work as you would expect
set backspace=indent,eol,start

" force the status line and tab line to always display
set laststatus=2
set showtabline=2
set guioptions-=e

" Spell check for Markdown and Git commit messages
autocmd FileType markdown,gitcommit setlocal spell
" Set text width at 80 characters
autocmd FileType markdown,gitcommit setlocal textwidth=80

" vim test
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

" Reload vim config
nnoremap <Leader><Leader>r :source ~/.vimrc<CR>

let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1

" Use ALE as completion sources for all code from deoplete
" let g:deoplete#sources = {'_': ['ale']}

let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'json': ['prettier'],
\   'scss': ['stylelint'],
\   'ruby': ['rubocop'],
\   'php': ['php_cs_fixer'],
\}
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 500
let g:ale_lint_on_save = 1
let g:ale_linters = {'ruby': ['solargraph', 'ruby', 'rubocop']}
set completeopt=menu,menuone,preview,noselect,noinsert

" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.html.erb,*.blade.php'

" This will make the list of non-closing tags self-closing in the specified
" files.
let g:closetag_xhtml_filenames = '*.jsx'

let g:vim_markdown_folding_disabled = 1

colorscheme challenger_deep
" let g:challenger_deep_termcolors = 16

" " set Vim-specific sequences for RGB colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

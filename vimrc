" Set standard file encoding
set encoding=utf8

" No special per file vim override configs
set nomodeline

" Stop word wrapping
set nowrap

" Except... on Markdown. That's good stuff.
autocmd FileType markdown setlocal wrap

" Adjust system undo levels
set undolevels=100

" Use system clipboard
set clipboard=unnamed

" Set tab width and convert tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells

" Number gutter
set number

" Use search highlighting
set hlsearch

" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5

" Remapping <Leader> to <Space>
let mapleader="\<SPACE>"

" Disable mouse support
set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Setting Arrow Keys to Resize Panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Return to the last file opened
nmap <Leader><Leader> <c-^>

" Next / Previous Buffer (Tab)
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'shougo/unite.vim'

Plug 'dracula/vim'

Plug 'yggdroot/indentline'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

Plug 'mhinz/vim-grepper'

Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'w0rp/ale'

Plug 'justinmk/vim-sneak'

Plug 'wakatime/vim-wakatime'

Plug 'mattn/emmet-vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'ryanoasis/vim-devicons'

Plug 'eslint/eslint'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  
Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

Plug 'elzr/vim-json'

Plug 'pangloss/vim-javascript'

Plug 'mxw/vim-jsx'

Plug 'cakebaker/scss-syntax.vim'

Plug 'ekalinin/dockerfile.vim'
  
Plug 'fatih/vim-go'

" Initialize plugin system
call plug#end()

color Dracula

let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" Space t or Space p opens Fuzzy Finder
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

" Space f p to type a search to find matches in entire project
nnoremap <Leader>fp :Grepper<Space>-query<Space>

" Space f b to type a search to find matches in current buffers
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

" Space backtick to toggle File Tree
map ` :VimFiler -explorer<CR>

" Space ~ to open File Tree from current buffer's directory
map ~ :VimFilerCurrentDir -explorer -find<CR>

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:sneak#s_next = 1

" f <key> to jump to next <key>
nmap f <Plug>Sneak_f

" F <key> to jump to previous <key>
nmap F <Plug>Sneak_F

" f to following match
xmap f <Plug>Sneak_f

" s <key><key> to jump to next <key><key>
xmap F <Plug>Sneak_F

" S <key><key> to jump to previous <key><key>
omap f <Plug>Sneak_f

" s to following match
omap F <Plug>Sneak_F

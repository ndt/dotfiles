"
" https://gist.github.com/ndt/neovim_init.vim
"
" vim: ts=4 sts=4 sw=4 fdm=marker

if has('nvim') && has('win32')
	let s:ndt_home = "$LOCALAPPDATA/nvim/plugged"
else
	let s:ndt_home = "~/.local/share/nvim/plugged"
endif

"
" Plugins {{{1

"
" Plugin loading {{{2
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin(s:ndt_home)
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
call plug#end()


"
" global appearance {{{1
set termguicolors
set mouse=a

"
" colors {{{1
set background=dark
colorscheme desert
hi NonText      gui=NONE guifg=gray30 guibg=gray20
hi LineNr                guifg=gray40 guibg=gray10
hi CursorLineNr                       guibg=gray10

"
" number column {{{1
set number
set relativenumber
set foldcolumn=3

"
" text area {{{1
set list
set listchars=eol:¶,tab:›\ ,trail:·,precedes:…,extends:…

let g:airline_powerline_fonts=1
set showtabline=1
let g:airline#extensions#tabline#enable=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'

"
" wrapping long lines {{{1
"  set wrap
"  set textwidth=76
"  set formatoptions=qrn1
"  set colorcolumn=80

"
" key bindings {{{1
let mapleader = ","

"
" gui stuff {{{1
if exists('g:GuiLoaded')
	Guifont! UbuntuMono NF:h12
endif


"
" vimwiki {{{1
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_tags': 1}]
let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/vimwiki/vwtags.py'
          \ , 'ctagsargs': 'default'
          \ }
autocmd FileType vimwiki setlocal ts=4 sts=4 sw=4 noexpandtab

" vim: ts=4 sts=4 sw=4 fdm=marker

" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" Home
if has('nvim') && has('win32')
	let s:ndt_home = "$LOCALAPPDATA/nvim"
elseif has('nvim')
	let s:ndt_home = "~/.local/share/nvim"
else
	let s:ndt_home = "~/.vim"
endif


"
" Plugin loading {{{2
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin(s:ndt_home."/plugged")
  Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'majutsushi/tagbar'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'

  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'lifepillar/vim-solarized8'

  Plug 'mattn/calendar-vim'
  Plug 'vimwiki/vimwiki'

  Plug 'pearofducks/ansible-vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()


filetype plugin indent on

" Color Scheme {{{
set termguicolors
colorscheme solarized8
set background=dark
highlight clear Normal
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Left Column {{{
set number
set relativenumber
set foldcolumn=3
set numberwidth=5
set nowrap

" Tab settings {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4

"set list
if has('multi_byte') && &encoding ==# 'utf-8'
	let &listchars = 'eol:␤,tab:› ,trail:·,precedes:…,extends:…'
else
	let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start

set laststatus=2
set undofile

let mapleader=","
imap jj <Esc>

" Searching {{{
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
" }}}

" wrapping long lines {{{
set wrap
set textwidth=79
set formatoptions=qrn1
" }}}

" autosave on tab change {{{
"autocmd FocusLost * wa
" }}}

" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}:Datum:    \).*#\1' .
          \ strftime('%Y-%m-%d %H:%M') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()

set backup                  " Backups are nice
if has('persistent_undo')
    set undofile                " So is persistent undo
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number of lines to save for undo on a buffer reload
endif

set undodir=~/.cache/vim/undo//
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//

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
au BufRead,BufNewFile *.wiki set filetype=vimwiki
" :autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
" :autocmd FileType vimwiki map c :call ToggleCalendar()

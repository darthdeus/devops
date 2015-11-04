" This must be first, because it changes other options as a side effect.
set nocompatible

set shell=sh

call plug#begin('~/.vim/bundle')

Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'godlygeek/tabular'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }

Plug 'krisajenkins/vim-projectlocal'
Plug 'AndrewRadev/switch.vim'
Plug 'eshock/vim-matchit'

Plug 'sjl/gundo.vim'

call plug#end()

" Change the leader to ","
let mapleader=","

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

set number
set ruler

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set list listchars=tab:\ \ ,trail:.

" Searching
set hlsearch
set incsearch
" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase
nnoremap <CR> :nohlsearch<CR>/<BS>

" Make tab completion for files/buffers act like bash
set wildmenu

set laststatus=0

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=bundle,obj,*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,node_modules,tmp,project/target,target,tags,CMakeFiles,bower_components,dist,_darcs,vcr,app/assets/images,*.dSYM,*.pyc,_build,deps,rel,*.a

command! W :w

" Status bar
set laststatus=2
set winwidth=75

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Remember last location in file
aug last_location
  au!
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
aug END

" Save undo history
if has('persistent_undo')
  set undofile
  if !isdirectory(expand('~/.vimundo'))
    silent !mkdir ~/.vimundo > /dev/null 2>&1
  endif
  set undodir=~/.vimundo
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show (partial) command in the status line
set showcmd

" Highlight current line
set cursorline

" Buffer resizing with arrow keys
nnoremap <Up> <C-w>5-
nnoremap <Down> <C-w>5+
nnoremap <Left> <C-w>5<
nnoremap <Right> <C-w>5>

nnoremap - :Switch<cr>

" Expand %% to directory path of current buffer
cnoremap %% <C-R>=expand('%:h').'/'<CR>
" nnoremap <leader>e :call VimuxRunCommand("make")<cr>
nnoremap <leader>r :call VimuxRunCommand("make ". expand("%h"))<cr>
nnoremap <leader>c :call VimuxRunCommand("make clean")<cr>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
" TODO - figure out more clever usage for this
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Open files with <leader>f
noremap <leader>f  :CommandTFlush<cr>\|:CommandT ./<CR>
" Open files, limited to the directory of the current files, with <leader>gf
noremap <leader>F  :CommandTFlush<cr>\|:CommandT %%<CR>
noremap <leader>gf :CommandTFlush<cr>\|:CommandT %%<CR>

nnoremap <C-a> ^
nnoremap <C-e> $

" For easier navigation between windows
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

" Bubble multiple lines
vnoremap <C-Up> <C-w><C-k>
vnoremap <C-Down> <C-w><C-j>
vnoremap <C-Left> <C-w><C-h>
vnoremap <C-Right> <C-w><C-l>

" fat fingers
noremap <F1> <Esc>

inoremap <C-X><C-@> <C-A>
" Emacs style mappings
inoremap      <C-A> <C-O>^
cnoremap      <C-A> <Home>
cnoremap <C-X><C-A> <C-A>

" If at end of a line of spaces, delete back to the previous line.
" Otherwise, <Left>
inoremap <silent> <C-B> <C-R>=getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"<CR>
cnoremap          <C-B> <Left>

" If at end of line, decrease indent, else <Del>
inoremap <silent> <C-D> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"<CR>
cnoremap          <C-D> <Del>

" If at end of line, fix indent, else <Right>
inoremap <silent> <C-F> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"<CR>
inoremap          <C-E> <End>
cnoremap          <C-F> <Right>
noremap!          <M-a> <C-O>(
map!              <M-b> <S-Left>
noremap!          <M-d> <C-O>dw
noremap!          <M-e> <C-O>)
map!              <M-f> <S-Right>
noremap!          <M-h> <C-W>
noremap           <M-l> guiww
noremap           <M-u> gUiww
noremap!          <M-l> <Esc>guiw`]a
noremap!          <M-u> <Esc>gUiw`]a
noremap!          <M-{> <C-O>{
noremap!          <M-}> <C-O>}

cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><C-w>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><C-w>
cnoremap <C-g>  <C-c>

" Disable accidental ex mode
nmap Q <NOP>

" Switching between active files in a buffer.
nnoremap <leader><leader> <c-^>

" CTags - TODO - find a good hotkey for this
noremap <leader>lt :!ctags --extra=+f -R *<CR>
noremap <C-\> :tnext<CR>

noremap <silent> <leader>y :<C-u>silent '<,'>w !pbcopy<CR>

aug various_file_types
  au!
  " Rakefile, Vagrantfile and Gemfile are Ruby
  au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,config.ru} set ft=ruby
  au BufRead,BufNewFile *.asm set ft=nasm

  " add json syntax highlighting
  au BufNewFile,BufRead *.json set filetype=javascript

  au BufNewFile,BufRead *.conf set filetype=conf
  au BufNewFile,BufRead *vimrc set filetype=vim
aug END

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" remove unnecessary whitespaces
noremap <leader>ws :%s/ *$//g<cr><c-o><cr>

set pastetoggle=<F5>
set mouse=a

let g:clang_format#code_style = "google"

autocmd FileType h,cc,c,cpp nnoremap <buffer><C-e> :<C-u>ClangFormat<CR>
autocmd FileType h,cc,c,cpp nnoremap <buffer><leader>ha :HeaderguardAdd<CR>
autocmd FileType h,cc,c,cpp vnoremap <buffer><C-e> :ClangFormat<CR>

nnoremap <Leader>e :call VimuxRunCommand("make")<cr>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

function! s:profilestop()
  profdel func *
  profdel file *
  qa!
endfunction

function! s:profilestart()
  profile start vim.profile
  profile func *
  profile file *
endfunction

command! -nargs=0 StopProfiling call s:profilestop()

set exrc
set secure

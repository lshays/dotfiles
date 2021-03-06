" Luke's Dope Vimrc file 
" Optimized for vim 7.3

" Plugin Stuff:
    set nocompatible
    filetype off
    
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    "
    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    "
    " Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
    Plugin 'scrooloose/nerdtree'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'vim-scripts/AutoComplPop'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd	" display incomplete commands
set mouse=a " Enable mouse
syntax on " Turn on syntax highlighting

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" My Changes:

" Key Bindings:
inoremap ii <Esc>
vnoremap ii <Esc> 
inoremap <expr> <Tab> search('\%#[]>)}"]', 'n') ? '<Right>' : '<Tab>' "Tab to exit quotes/brackets

" Display Line Numbers:
set number

" Set Synonomous Filetypes:
autocmd! BufRead,BufNewFile *.mako     setfiletype html

" YouCompleteMe Options:
let g:ycm_autoclose_preview_window_after_completion = 1

" Automatically Enter NERDTree:
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * wincmd p

" Syntastic Options:
let g:syntastic_python_checkers = ['pyflakes', 'python', 'pylint']
let g:syntastic_quiet_messages = { "!level":  "errors" } "Ignore all messages besides errors
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1

" Change Backup Location:
set backup " keep a backup file (restore to previous version)
set undofile " keep an undo file (undo changes after closing)
" You must create the location below for this to work
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

" Tab Setup:
set tabstop=4 " number of visual spaces per Tab
set softtabstop=4 " number of spaces  in tab when editting
set expandtab " tabs are spaces
set shiftwidth=4

" Search Settings:
nnoremap <leader><space> :nohlsearch<CR> " leader + space removes highlighted searches
set incsearch " do incremental searching
set hlsearch " Highlight all matched patterns when searching

" Copy And Paste Settings:
" Only works if :echo has('clipboard') does not return 0
set clipboard=unnamedplus " Copy/Paste functions now use system clipboard

" Colorscheme: 
syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


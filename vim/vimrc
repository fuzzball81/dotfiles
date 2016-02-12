set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'sickill/vim-monokai'
call vundle#end() 

filetype plugin indent on

" set number
let c_space_errors = 1
let g:load_doxygen_syntax=1
set incsearch
syntax on

set laststatus=2

let g:airline_powerline_fonts = 1
"set ambiwidth=double
let g:airline#extensions#tabline#enabled = 1
set ttimeoutlen=50
set noshowmode

" Fix tmux background color
if &term =~ '256color'
	set t_ut=
endif

set t_Co=256
set background=dark

if has('gui_running')
	if has('gui_gtk2')
		set guifont=Liberation\ Mono\ for\ Powerline\ 10
	else
		set guifont=Liberation\ Mono\ for\ Powerline:h11
	endif
	colorscheme relaxedgreen
else
	colorscheme askapachecode
endif

imap <F5> <C-o>:setlocal spell! spelllang=en_us<CR>

map <F12> :call TrimWhiteSpace()<CR>
" Removes trailing spaces
func! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

set backspace=indent,eol,start
set cin
set ai
set si
set noci
set hlsearch
set nu
map <silent> <F1> :let @/=""<CR>

au BufNewFile,BufRead SCons* set filetype=scons

" OmniCppComplete Stuff
set nocp
filetype plugin on
set ofu=syntaxcomplete#Complete
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

set wildmode=longest:full
set wildmenu

let g:syntastic_python_checkers=['flake8']
" Disable E501(over 79 chars), W191(tabs instead of space), W391(blank line at
" end of file, E126(indent over 4 spaces)
let g:syntastic_python_flake8_args='--ignore=E501,W391'

let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler = 'g++'
"let g:syntastic_mode_map = { 'mode': 'active',
"		\ 'active_filetypes': ['python', 'javascript', 'css', 'html'],
"		\ 'passive_filetypes': ['make','cpp','c'] }

"Jedi Stuff
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0

" Supertab Setup
autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
    \ endif

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


function! SetTabsToSpaces()
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal smarttab
  setlocal expandtab
:endfunction

function! SetSpacesToTabs()
  setlocal tabstop=5
  setlocal softtabstop=5
  setlocal shiftwidth=5
  setlocal smarttab
  setlocal noexpandtab
:endfunction

map <silent> <F2> :call SetTabsToSpaces()<CR>
map <silent> <F3> :call SetSpacesToTabs()<CR>

set cursorline
"hi cursorline gui=none ctermbg=none
augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au BufEnter /* call LoadCscope()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

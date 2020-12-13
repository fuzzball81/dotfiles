call plug#begin()
"Plug 'ervandew/supertab'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/trailing-whitespace'
Plug 'w0rp/ale'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'pearofducks/ansible-vim', { 'for': 'yaml' }
Plug 'chase/vim-ansible-yaml'
" Plug 'lepture/vim-jinja'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
" Plug 'davidhalter/jedi-vim'
" Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tpope/vim-fugitive'
Plug 'qpkorr/vim-bufkill'
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-vim'
" Plug 'fgrsnau/ncm2-aspell'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
call plug#end()

let g:python_host_prog = '/home/jjoyce/virtualenvs/neovim2/bin/python'
let g:python3_host_prog = '/home/jjoyce/virtualenvs/neovim3/bin/python'

filetype plugin indent on

" Keep 5 lines in view when searching
set scrolloff=5

" ncm2 stuff
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect,longest

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })


" set number
let c_space_errors = 1
let g:load_doxygen_syntax=1
set incsearch
syntax enable

let g:kite_tab_complete=1
set laststatus=2  " always display the status line

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
set ttimeoutlen=50
set noshowmode

" Fix tmux background color
" if &term =~ '256color'
" 	set t_ut=
" endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'

set background=dark
colorscheme gruvbox

imap <F5> <C-o>:setlocal spell! spelllang=en_us<CR>

map <F6> :call TrimWhiteSpace()<CR>

" Removes trailing spaces
func! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

if has('nvim')
	" Terminal Setup
	tnoremap <Esc> <C-\><C-n>
	tnoremap <M-s> <Esc>
	tnoremap <C-v><Esc> <Esc>
	tnoremap <C-w> <C-\><C-n><C-w>
	autocmd BufWinEnter,WinEnter term://* startinsert
	autocmd BufLeave term://* stopinsert

endif


" search for tags
" set tags=./tags;

set backspace=indent,eol,start
set cin
set ai
set si
set noci
set hlsearch
set nu
map <silent> <F1> :let @/=""<CR>

au BufNewFile,BufRead SCons* set filetype=scons
au BufNewFile,BufRead *.yaml set filetype=ansible
au BufNewFile,BufRead *.yml set filetype=ansible


" OmniCppComplete Stuff
set nocp
filetype plugin on
" set completeopt-=preview

set wildmode=longest:full
set wildmenu

" ale options
let g:ale_python_flake8_options='--ignore=E501,W503'
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_completion_enabled = 0
let g:ale_python_pylint_auto_pipenv = 1

" deoplete setup
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#jedi#show_docstring = 0
" disable autocomplete by default
" let b:deoplete_disable_auto_complete = 1
" let g:deoplete_disable_auto_complete = 1

"Jedi Stuff
" let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#popup_on_dot = 1
" let g:jedi#completions_enabled = 0

"Ansible syntax plugin
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1


" Supertab Setup
" autocmd FileType *
"     \ if &omnifunc != '' |
"     \   call SuperTabChain(&omnifunc, "<c-p>") |
"     \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"     \ endif
" let g:SuperTabDefaultCompletionType = "context"

set colorcolumn=80
set cursorline
"hi cursorline gui=none ctermbg=none
augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END


" function! LoadCscope()
" 	let db = findfile("cscope.out", ".;")
" 	if (!empty(db))
" 		let path = strpart(db, 0, match(db, "/cscope.out$"))
" 		set nocscopeverbose " suppress 'duplicate connection' error
" 		exe "cs add " . db . " " . path
" 		set cscopeverbose
" 	endif
" endfunction
" au BufEnter /* call LoadCscope()

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

if &diff
"	autocmd VimEnter * Gdiff
	set noreadonly
endif

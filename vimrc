" load pathogen before loading filetype!!!
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" This doesn't work
"let g:pathogen_disabled = []
"Disable minibufexpl
"call add(g:pathogen_disabled, 'minibufexpl')
"Is this necessary?
"call pathogen#infect()

set t_Co=256

" set leader key
let mapleader = ","

" turn off ESC to force use of Ctl+[ 
" this creates problem with a lot of plugins
" :noremap <Esc> <Nop>

set nocompatible
set number

syntax on
filetype on
filetype plugin indent on

"set background=dark  "makes it easier to read with black background
"colorscheme ir_black "set theme in ./vim/colors folder
colorscheme molokai
set ls=2            " allways show status line
set hlsearch        " highlight searches
"set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
"set ignorecase        "ignore case while searching
set cursorline  "highlight current line
"
" start buffer indexing at 1
" set g base-index 1
"
set viminfo='100,f1
"If you have viminfo set, it will save local marks (a-z) by default. The
"f1100 tells Vim to save marks and other information for up to 100 files.
"The f1 directive tells Vim to also save global marks (A-Z) when it exits. If
"you don't want Vim to do this, set it to f0 instead.
"
"
" Folding settings
set foldnestmax=10
" don't fold by default
set nofoldenable
"
 
" Change default Window switching
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
 
" snippet path
"g:snippets_dir=$HOME."/dotfiles/vim/snippets"
let g:snippets_dir=$HOME."/dotfiles/vim/snippets/"
 
" Status Bar
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
 
" ******************* PLUGIN configs ******************
"
" Plugin ------------ TagList
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
"
" Plugin ------------ NerdTree
map <leader>n :NERDTreeToggle<CR>
"
"
"
" Plugin ------------ TaskList
" map <leader>td <Plug>TaskList
 
" Plugin ------------ Gundo
map <leader>g :GundoToggle<CR>
 
" MiniBufExpl Colors
" hi MBEVisibleActive guifg=#A6DB29 guibg=fg
" hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
" hi MBEVisibleChanged guifg=#F1266F guibg=fg
" hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
" hi MBEChanged guifg=#CD5907 guibg=fg
" hi MBENormal guifg=#808080 guibg=fg
"let g:miniBufExplForceSyntaxEnable = 1 
"
" http://www.devdaily.com/linux/vi-vim-editor-color-scheme-syntax
" pyflakes underline
" highlight SpellBad cterm=underline,bold, ctermfg=red
" fg is the text, bg is obviously the background. Using 'bg' leaves the text
" unchanged
highlight SpellBad term=standout term=underline ctermfg=Magenta ctermbg=bg cterm=underline,bold

if has("gui_running") 
 highlight SpellBad term=underline gui=undercurl,bold guisp=Magenta
endif 


" ------------------ PYTHON Related config (see also ftplugin/python.vim)
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview
let g:pyflakes_use_quickfix = 0

" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

"" Execute the tests Pytest
"nmap <silent><Leader>tf <Esc>:Pytest file<CR>
" nmap <silent><Leader>tc <Esc>:Pytest class<CR>
"nmap <silent><Leader>tm <Esc>:Pytest method<CR>
"" cycle through test errors
"nmap <silent><Leader>tn <Esc>:Pytest next<CR>
"nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
"nmap <silent><Leader>te <Esc>:Pytest error<CR>
"
" Javascript
" https://github.com/hallettj/jslint.vim/issues/13
" " Use Node.js for JavaScript interpretation
let $JS_CMD='node'

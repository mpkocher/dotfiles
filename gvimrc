syntax on
"colorscheme ir_black
set guifont=Monaco:h12
"set guioptions-=T

" turn off scrollbars
" this is funky and doesn't work as expected
" set guioptions-=lrb
" turn off right hand scroll bar
"set guioptions-=r
" set guioptions-=l
" set guioptions-=r
" set guioptions-=b
" this is a stupid hack to make this work as expected
" http://thisblog.runsfreesoftware.com/?q=Remove+scrollbars+from+Gvim
set guioptions+=LlRrb
set guioptions-=LlRrb

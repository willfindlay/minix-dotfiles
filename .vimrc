filetype plugin on

" Indent settings
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" Set line numbers to be on by default
set number

" Set line wrapping
set breakindent
set wrap lbr

" Add filename at bottom
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
hi StatusLine cterm=NONE ctermfg=2 ctermbg=NONE
set ls=2

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" for command mode
" nnoremap <S-Tab> <<
" for insert mode
map <Esc>[Z <s-tab>
ounmap <Esc>[Z
inoremap <S-Tab> <C-d>
inoremap <Tab> <C-t>
nnoremap <S-Tab> <<
nnoremap <Tab> >>
vnoremap <S-Tab> <
vnoremap <Tab> >
nnoremap <S-q> <<

set backspace=indent,eol,start
syntax on

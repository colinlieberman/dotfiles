syntax on

"capslock: https://github.com/tpope/vim-capslock
source ~/.vim/vim-capslock/plugin/capslock.vim

colorscheme koehler
"set textwidth=78
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set shiftround
set autoindent
set ignorecase
set number
set magic
set wrapscan
set showmode
set showmatch
set laststatus=2
set visualbell
set expandtab
"tabs for postgres and Makefiles
autocmd BufRead,BufNewFile *itpgh/*,*postgresql/* set noexpandtab
autocmd BufRead,BufNewFile *Makefile* set noexpandtab
set formatoptions+=r
set wrapmargin=0
set matchpairs+=<:>
set ruler
set hlsearch
set pastetoggle=<F2>

map <F5> :nohlsearch<CR>

" remove trailing whitespace
command WS :%s/\s\+$//e

au! Syntax go source /usr/local/go/misc/vim/syntax/go.vim
au! Syntax godoc source /usr/local/go/misc/vim/syntax/godoc.vim
au! Syntax pgsql source ~/pgsql.vim

" use html formatting for template toolkit and handlebars
au BufNewFile,BufRead *.go set filetype=go
au BufNewFile,BufRead *.godoc set filetype=godoc
au BufNewFile,BufRead *.sql set filetype=pgsql
au BufNewFile,BufRead *.tt set filetype=html
au BufNewFile,BufRead *.handlebars set filetype=html " tw=0
au BufNewFile,BufRead *.asp set filetype=perl
au BufNewFile,BufRead *.t set filetype=sh

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

function MethodComment()
    " make sure not in paste mode
    let startpaste = &paste
    if startpaste
        :set invpaste
    endif 

    if &filetype == "perl"
        let comment = [ "###", " # Purpose:", " # Params:", " # Returns:" ]
    else
        let comment = [ "/***", " * Purpose:", " * Params:", " * Returns:", " */" ]
    endif

    " append appends after the line given, so if possible,
    " move up (assumes called from line where method
    " is defined )
    call append( line('.') - 1, comment )
    
    " if we started in paste mode, set it back
    if startpaste
        :set invpaste
    endif 
endfunction
command MC call MethodComment()
map <F3> :MC<CR>
map! <F3> <esc>:MC<CR>

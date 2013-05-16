set nocompatible

if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIMRUNTIME,$HOME/.vim/after
endif

filetype on
filetype off
set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()

set background=dark

" Bundles {

    source ~/.vim/bundles.vim

" }


" System {

    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost vimrc source $MYVIMRC

    filetype on
    filetype plugin on
    filetype indent on
    scriptencoding utf-8

    set history=1000
    nnoremap <leader>b :make<cr>

" }


" Searching {

    set incsearch
    set hlsearch 
    set ignorecase
    set smartcase
    nnoremap <cr> :noh<cr><cr>

" }


" Editing {

    set tabstop=4
    set shiftwidth=4
    set expandtab
    set backspace=indent,eol,start
    set foldmethod=syntax
    nnoremap <space> za<space>
    set nofoldenable
    set undolevels=1000
    set pastetoggle=<F2>

    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.

    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

" }


" Buffers {

    no <C-h> <C-w>h  
    no <C-j> <C-w>j
    no <C-k> <C-w>k
    no <C-l> <C-w>l

    set hidden

" }


" Styling {

    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
    set number

    set showmode
    set cursorline

    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    "set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

    syntax enable

    colorscheme molokai 

    if has('gui_running')
        set lines=50 columns=95
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256
        endif
    endif

" }


" CTags {

   set tags=./tags;/,~/.vimtags

" }

map <leader>f :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc', '\.beam', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

map <leader>c :TagbarOpenAutoClose<cr>

let g:ctrlp_custom_ignore = { 
    \ 'dir':  'ebin$\|\.git$\|\.hg$\|\.svn$', 
    \ 'file': '\.beam$\|\.exe$\|\.so$\|\.dll$' }

" neocomplcache {

    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_max_list = 10

    " AutoComplPop like behavior.
    let g:neocomplcache_enable_auto_select = 0


    " <CR>: close popup
    " <s-CR>: close popup and save indent.
    inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
    inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"

    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()

" }

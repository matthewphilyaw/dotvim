"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The .vimrc file is ran everytime a new VIM instance is started adn
" applies to all VIM instances (GUI and terminal). Use .gvimrc to 
" override or add settings for GUI.
"
" The file is broken down into groups of settings and each one
" should be documented to express the purpose behind the setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: This should be first
" By default VIM starts up in VI compatibility mode but 
" it can interfere with some commands since they were not
" supported in VI. At this point there is no reason for it. 
set nocompatible


" Pathogen {

    " NOTE: We have to get pathogen setup before the filetype 
    " options to make sure it loads everything correctly

    " By default the .vim directory follows a similar convention to
    " the Linux filesystem with special directories to put the
    " different bits of a plugin in (docs go in doc/ kind of thing)
    " so to help manage plugins better lets use the bundling idea
    " that pathogen allows you.
    "
    " Plugins now go in their each directory: .vim/bundles/<plugin>
    call pathogen#infect()

" }


" System {

    " For convenience, when we write changes to our vim profile
    " auto load them back into our vim session.
    if has('autocmd')
        autocmd bufwritepost .vimrc source $MYVIMRC
        " for windows
        autocmd bufwritepost _vimrc source $MYVIMRC
    endif
    
    " VIM will try to determine the filetype and setup extra settings
    " This will not work with compability mode on.
    filetype on

    " Once VIM knows what filetype you are editing it will
    " try to run the plug-in for that filetype. It will attempt to
    " load $HOME/.vim/ftplugin/<type>.vim
    filetype plugin on

    " Use the filetype to determine indention schemes
    filetype indent on


    " If VIM has been compiled with unicode support then lets use it
    " Taken from: http://vim.wikia.com/wiki/Working_with_Unicode
    if has("multi_byte")
        " termencoding is the encoding the keyboard input will be
        " understood as. We set it to what the encoding setting is
        " at now to try and avoid overriding locale info used for
        " your keyboard setup 
        if &termencoding == ""
            let &termencoding = &encoding
        endif

        " display things as utf-8
        set encoding=utf-8

        " by default files should use utf-8 and drop da bomb or
        " byte order mark so we can tell what encoding the file is in
        setglobal fileencoding=utf-8 bomb

        " when reading a file try to match the byte order mark of the
        " file, otherwise try utf-8, finally just plain ascii
        set fileencodings=ucs-bom,utf-8,latin1
    endif 

    " Remember a lot of commands so we can always find that 
    " one that worked
    set history=1000

    " Remap the tab key to do autocompletion or 
    " indentation depending on the context 
    " from http://www.vim.org/tips/tip.php?tip_id=102
    function! InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
            return "\<tab>"
        else
            return "\<c-p>"
        endif
    endfunction
    inoremap <tab> <c-r>=InsertTabWrapper()<cr>
    inoremap <s-tab> <c-n>

" }


" Editing {

    " This is how many spaces a tab is counted as being. Default is 8.
    set tabstop=4

    " How many spaces to insert when indenting (doesn't mean 
    " using <tab>). This is used for autoindenting and the 
    " '>' and '<' indent commands
    set shiftwidth=4

    " To be consistent and easier going when editing code 
    " *cough* Python *cough*
    " let's always expand a tab to the number of spaces and not just a
    " visual thing. A lot of editors seem to work this way.
    set expandtab

    " We want to be able to backspace/delete over any 
    " tabbing/indenting, newlines, and where we started INSERT mode,
    " you know what you expect instead of the VI compatible backspacing
    set backspace=indent,eol,start

    " When we fold or unfold a block of text determine the block
    " delimiters via syntax. You can use 'za' to toggle a fold.
    " There are several other commands as well.
    " 'zM' to close all folds
    " 'zR' to open all folds
    set foldmethod=syntax

    " Lets map 'za' to spacebar while in NORMAL mode
    nnoremap <space> za<space>

    " By default I like to see all the code, but the first time
    " you try to fold something this will get toggled and all folding
    " well be on.
    set nofoldenable

    " Remember the past 1000 edits for supreme undo action
    set undolevels=1000

    " Without paste mode large blocks of text will get autoindented
    " if that feature is on and look terrible. Toggle it on before
    " pasting then off when done.
    set pastetoggle=<F2>

" }


" Buffers {
    
    " You use the Ctrl + w + movement to move focus between 
    " split buffers on screen. Just mapping it to the 
    " quicker Ctrl + movement.
    no <C-h> <C-w>h  
    no <C-j> <C-w>j
    no <C-k> <C-w>k
    no <C-l> <C-w>l

    " Keeps buffers open when you start to edit another file. They
    " are just kept in the background or hidden from view. Access
    " the list of current buffers via ':ls', use ':buffer <number>'
    " to switch to that buffer
    set hidden

" }


" Tabs {

    "Give you the familiar Ctrl+N in normal model to create a new tab. 
    ":tabs can list out the tabs and :tabn # to switch to a specific tab
    no <C-n> :tabnew<cr>    

    "Ctrl+Tab to cycle forward through your tabs. use :tabPrevious to
    "cycle backwards.
    no <C-tab> :tabNext<cr>

" }


" Styling {

    " Show us where the cursor is in the bottom lower right
    set ruler

    " Show us the current incomplete command in the bottom
    " status bar. This shows up to the left of the ruler.
    set showcmd

    " Show the line number before each line.
    set number

    " Use the filetype information to give us syntax highlighting.
    syntax enable
           
    " Using a custom color scheme. Custom schemes get loaded from
    " $HOME/.vim/colors. This would apply to all VIM instances.
    " Move this to .gvimrc or override there to have different 
    " color schemes
    colorscheme molokai 

" }


" Searching {

    " Highlights the first search match while you type
    set incsearch

    " We want to see all search results highlighted and not just
    " the current one we are on. 
    " Use ':noh' to diable the highlighting for the current search
    set hlsearch 

    " By default the search will ignore case
    set ignorecase

    " If the search phrase is of mixed case then the search
    " will be case sensitive
    set smartcase

    " To make it a little more convenient we'll map :noh to <cr>
    " but we'll do it only for NORMAL mode. Including the second
    " <cr> to make sure we don't override anything
    nnoremap <cr> :noh<cr><cr>

" }


" General Development {

    " VIM inserts a null character on Ctrl+Space
    " remapping that to popup the omnicompletion dialog 
    imap <Nul> <C-x><C-o>

    " Look for a ctags file starting in current directory and 
    " working all the way up to root
    set tags=tags;/

" }


" NERDTree {

    " NERDTree is an excellent directory browser plugin. Lets make it
    " quicker to access by mapping it to '<leader>f'. The <leader>
    " key is '\' by default. If taglist is loaded lets close it first
    map <leader>f :NERDTreeToggle<cr>

    " Setup some file ignores
    let NERDTreeIgnore=['\.pyc$', '\.beam$']

" }


" tagbar {

    " tagbar gives you a buffer of the tags sorted by scope.
    " Check out Exuberant Tags project or :help tags for more info.
    " Use 'ctags -R' at your project root to generate tags.
    " Or add it to your build script

    " Since <leader>t is used to run tests lets map the tag list
    " to <leader>c for code tags (ctags). This will have it open
    " take focus and close once we have picked a tag
    map <leader>c :NERDTreeClose<cr>:TagbarToggle<cr>

" }


" Syntastic Settings {

    " See the Syntastic documentation for more information
    " https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt

    " Enable the statusline, which appears
    " when syntax errors are detected
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    " Signs are placed beside lines with syntax errors, where
    " a different sign is used for errors and warnings
    let g:syntastic_enable_signs=1

    " Automatically close the location list when no errors only
    "does not auto open
    let g:syntastic_auto_loc_list=2

    " Opens the location list for the errors syntastic discovers
    map <leader>e :Errors<cr>

" }

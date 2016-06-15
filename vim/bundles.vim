set nocompatible

filetype on
filetype off
set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

Plugin 'flazz/vim-colorschemes'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'

if executable('ack') || executable('ack-grep')
  Plugin 'mileszs/ack.vim'
endif

if executable('ag')
  Plugin 'rking/ag.vim'
endif

if executable('ctags')
  Plugin 'majutsushi/tagbar'
endif

if executable('lldb')
  Plugin 'gilligan/vim-lldb'
endif

Plugin 'bjoernricks/vim-cmake'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'leshill/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-scripts/OmniCppComplete'

Plugin 'tpope/vim-markdown'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'jimenezrick/vimerl'
Plugin 'elixir-lang/vim-elixir'
Plugin 'thinca/vim-ref'

Plugin 'wting/rust.vim'
Plugin 'ervandew/supertab'

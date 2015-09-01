set nocompatible

filetype on
filetype off
set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'myusuf3/numbers.vim'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'

if executable('ack')
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

Plugin 'leshill/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'

Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'ChrisYip/Better-CSS-Syntax-for-Vim'
Plugin 'groenewege/vim-less'

Plugin 'tpope/vim-markdown'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'jimenezrick/vimerl'
Plugin 'copenhas/vim-elixir'

Plugin 'wting/rust.vim'

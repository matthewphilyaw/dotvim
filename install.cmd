set dotvimdir=%CD%

chdir %HOME%
mklink .vimrc %dotvimdir%\vimrc
mklink /D .vim %dotvimdir%\vim
chdir %dotvimdir%

git clone https://github.com/gmarik/vundle.git ./vim/bundle/vundle
vim +BundleInstall +qall

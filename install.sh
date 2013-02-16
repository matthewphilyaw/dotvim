dotvimdir=`pwd`

cd $HOME
ln -s $dotvimdir/vimrc .vimrc
ln -s $dotvimdir/vim .vim
cd $dotvimdir

git clone https://github.com/gmarik/vundle.git ./vim/bundle/vundle
vim +BundleInstall +qall

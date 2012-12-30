
##Installation

###Cloning the repo

    git clone git://github.com/lleixat/dotvim.git ~/.vim

###Create symlinks

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

###Switch to the `~/.vim` directory, ...

... and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

###Or if you have a repo list and `gitvim`

    gitvim -af repolist


##Usage

###Update

####First method: Using shell config file (.zshrc exemple)

Add something like this to your `~/.zshrc` (or `~/.bashrc`)

    function vimplug_update () {
        cd $HOME/.vim/ && git submodule foreach git pull origin master && echo -e "\n:: Back to current directory :" && cd -
    }

Do

    source ~/.myshellrc && vimplug_update

`.myshellrc` corresponding on your preferred shell system like `.zshrc`.

You can execute `vimplug_update` every time you want to update your plugins. 

####Second method: Using gitvim script

Use `gitvim` script installed in `$PATH` (like `$HOME/bin/`) or creating symlink: `ln -s $HOME/.vim/gitvim $HOME/bin/gitvim`

Updating all plugins : `gitvim -u`

Or updating only 'PIV' submodule : `gitvim -u bundle/PIV`

##TODO

Maybe giving `gitvim` his own repo ?

##Play with me

Send issues, pull requests, a beer or whatever ...

That's all... thx for watching !

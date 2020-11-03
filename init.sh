program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1';  }

    # fail on non-zero return value
    if [ "$ret" -ne 0  ]; then
        return 1
    fi
    return 0
}

# Configuring .vimrc file for vim
#if program_exists vim; then
    #echo "vim is installed"
#fi
if [ -e ~/.vimrc ]; then
    echo "~/.vimrc exsits, removing it."
    rm ~/.vimrc
fi
ln -s ${PWD}/.vimrc ~/.vimrc

if [ -e ~/.config/nvim/init.vim ]; then
    echo -n ""
else
    mkdir -p ~/.config/nvim
fi

echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> ~/.config/nvim/init.vim
echo "let &packpath=&runtimepath" >> ~/.config/nvim/init.vim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

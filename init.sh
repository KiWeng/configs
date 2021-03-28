program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1';  }

    # fail on non-zero return value
    if [ "$ret" -ne 0  ]; then
        return 1
    fi
    return 0
}

# Configuring .vimrc file for vim.
#if program_exists vim; then
    #echo "vim is installed"
#fi
if [ -e ~/.vimrc ]; then
    echo ".vimrc exsits, removing it."
    rm ~/.vimrc
fi
ln -s ${PWD}/.vimrc ~/.vimrc

# Configuring init.vim for nvim, so that nvim can use all the vim configs.
if [ -e ~/.config/nvim/init.vim ]; then
    echo "init.vim exsits, removing it."
    rm ~/.config/nvim/init.vim
else
    mkdir -p ~/.config/nvim
fi
ln -s ${PWD}/init.vim ~/.config/nvim/init.vim

# Configuring zsh, supposed oh-my-zsh is installed.
if [ -e ~/.zshrc ]; then
    echo "~/.zshrc exsits, removing it."
    rm ~/.zshrc
fi
ln -s ${PWD}/.zshrc ~/.zshrc

# Installing some of the external zsh plugins.
git clone https://github.com.cnpmjs.org/zsh-users/ \
    zsh-autosuggestions ${ZSH_CUSTOM:-~.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com.cnpmjs.org/zsh-users/ \
    zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Configuring git, supposing oh-my-zsh is installed.

if [ -e ~/.gitconfig ]; then
    echo "~/.gitconfig exsits, removing it."
    rm ~/.gitconfig
fi
ln -s ${PWD}/.gitconfig ~/.gitconfig

# Configuring tmux

if [ -e ~/.tmux.conf ]; then
    echo "~/.tmux.conf exsits, removing it."
    rm ~/.tmux.conf
fi
ln -s ${PWD}/.tmux.conf ~/.tmux.conf

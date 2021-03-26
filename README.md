# Wzh's personal config files

This is my personal config files and it's currently under construction.
Configs that I've been keeping track of is listed below.
Details of my configs is explained in the file itself, and it is self-explainatory (hopefuly).
`init.sh` is the shell script I've been working on to automate the process of setting up all the config files.

## git

The path where zsh load its config file is:

```shell
~/.gitconfig
```

## zsh

The path where zsh load its config file is:

```shell
~/.zshrc
```

Since I'm using oh-my-zsh, you should install oh-my-zsh first.

## Alacritty

The path where alacritty load its config file is:

```shell
~/.config/alacritty/alacritty.yml
```

## vim/nvim

I personnaly preferred to use nvim, most of the setting is compatiable with the vim.
For plugin management I am usings VimPlug.
The path where vim load its config file is:

```shell
~/.vimrc
```

and nvim keeps its config file as

```shell
~/.config/nvim/init.vim
```

adding these lines of code into your `init.vim` will help nvim use your `.vimrc`:

```vim script
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

## ideavim

The path where ideaVim load its config file is:

```shell
~/.ideavim
```

## tmux

The path where tmux load its config file is:

```shell
~/.tmux.conf
```

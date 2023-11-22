My dotfiles

Optimized for Ubuntu 22.04

Supported features:

[x] tmux
[x] Oh-My-Zsh https://ohmyz.sh/
[ ] @ctrlpvim/ctrlp.vim
[ ] @editorconfig/editorconfig-vim
[ ] @mxw/vim-jsx
[ ] @pangloss/vim-javascript
[ ] @prettier/vim-prettier
[ ] @tpope/commentary
[ ] @tpope/vim-surround
[ ] @vim-airline/vim-airline


# Before setting up

Install latest git

> sudo apt-get install -y git 

Install latest tmux

> sudo apt-get install -y tmux

Install latest zsh

> sudo apt-get install -y zsh

Install latest vim

> sudo apt-get install -y vim

# Install dotfiles 

Clone this repo

> git clone git@github.com:joshuamabina/dotfiles.git ~/.dotfiles

Install dependencies

> git submodule init && git submodule update

Setup tmux

```
ln -sf ~/.dotfiles/_tmux.conf ~/.tmux.conf
```

Setup ohmyzsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp ~/dotfiles/_zshrc ~/.zshrc

cp ~/dotfiles/_bashrc ~/.bashrc
```

Setup vim

```
ln -sf ~/.dotfiles/_vimrc ~/.vimrc \ 
&& ln -sf ~/.dotfiles/_vim ~/.vim
```

##### Adding a Vim plugin

1. Create a new directory to hold the plugin, `mkdir -p [_vim/pack/plugin-author/start]`
2. Clone the plugin GitHub repo as a git submodule, `git submodule add [plugin-git-url]`
3. Stage, commit, and push changes for review and merging.

### Todo

- Deprecate LINKS.md
- Remove vim-fugitive. Use basic git commands.
- Maybe, [\_vim/pack/start/plugin-name]
- Installing submodules with a shallow clone?
- Extract basic configurations to basic.vimrc plugin
- Install script for tmux
- Install script for zsh
- Install script for ohmyzsh
- Add bash aliases: source, update-zsh update-bash

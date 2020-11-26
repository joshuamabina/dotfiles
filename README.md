My dotfiles

### Requirements

- Vim 8.0+

### Installation

1. Clone this repository `git clone git@github.com:joshuamabina/dotfiles.git ~/.dotfiles`.
2. Install dependencies, `git submodule init && git submodule update`.
3. Create local vimrc, `ln -sf ~/.dotfiles/_vimrc ~/.vimrc`
5. Create local vim directory, `ln -sf ~/.dotfiles/_vim ~/.vim`
4. Create local tmuxrc, `ln -sf ~/.dotfiles/_tmux.conf ~/.tmux.conf`
6. Manually update `config` directory to add `tilda` and `openbox` configurations

### Supported features

- Vim
- Openbox
- Tilda
- Tmux
- Zsh

### Vim things

- @ctrlpvim/ctrlp.vim
- @editorconfig/editorconfig-vim
- @mxw/vim-jsx
- @pangloss/vim-javascript
- @prettier/vim-prettier
- @tpope/commentary
- @tpope/vim-fugitive
- @tpope/vim-surround
- @vim-airline/vim-airline

##### Adding a Vim plugin

1. Create a new directory to hold the plugin, `mkdir -p [_vim/pack/plugin-author/start]`
2. Clone the plugin GitHub repo as a git submodule, `git submodule add [plugin-git-url]`
3. Stage, commit, and push changes for review and merging.

### Todo

- Deprecate LINKS.md
- Maybe, [\_vim/pack/start/plugin-name]
- Installing submodules with a shallow clone?
- Extract basic configurations to basic.vimrc plugin

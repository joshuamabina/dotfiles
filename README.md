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

### Todo

- Deprecate LINKS.md

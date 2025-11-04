# My dotfiles

I maintain this repo slowly, mainly to support my Vim development workflow.

Posting an issue works, but emailing me at mabinajoshua@gmail.com will usually get a faster response.

Optimized for Ubuntu 22.04 and tailored for:

- Dart and Flutter
- Laravel-PHP development
- React
- Python development

For setup instructions, see [docs.md](./docs/docs.md). For ideas, todos, and the product roadmap, check [todos.md](./docs/todos.md).

## Inspiration

- [Vim and Python: A Match Made in Heaven](https://realpython.com/vim-and-python-a-match-made-in-heaven)

## Server setup

If you use Vim on the server, install latest git, tmux, zsh and vim

```
sudo apt-get install -y git tmux zsh vim 
```

You might also want to check:

- basic.vimrc
- basic.zshrc

## Before setting up locally

Install latest git, tmux, and zsh


```
sudo apt-get install -y git tmux zsh
```

## Installing and adding a Vim plugin

1. Clone the plugin GitHub repo as a git submodule, `git submodule add --depth=1 [plugin-git-url] [_vim/pack/plugins/start/]`

2. Stage, commit, and push changes for review and merging.

## Dependencies

- https://github.com/ctrlpvim/ctrlp.vim
- https://github.com/tpope/vim-commentary
- https://github.com/tpope/vim-surround
- https://github.com/sheerun/vim-polyglot
- https://github.com/vim-airline/vim-airline
- https://github.com/prettier/vim-prettier

## TODOs

- [ ] basic.vimrc: Vim with zero configuration.
- [ ] tmux: Installation and configuration.
- [ ] ohmyzsh: Installation and configuration.
- [ ] php-laravel: Support for phpenv and Vim.
- [ ] dart-flutter: Support for fvm and Vim.
- [ ] python: Installation and configuration, Vim support, virtualenv support.
- [ ] Create install scripts for [phpMyAdmin (using Docker)][https://docs.phpmyadmin.net/en/latest/setup.html#installing-using-docker]
- [x] Create install scripts for Vim.
- [x] Create install scripts for nvm.
- [ ] Create install scripts for nginx.
- [ ] Create install scripts for mysql.
- [ ] Create install scripts for tmux.
- [ ] Create install scripts for oh-my-zsh.
- [ ] Create install scripts for docker.
- [ ] Create install scripts for setting up a PHP version manager https://github.com/Thavarshan/phpvm
- [ ] Create install scripts for setting up a VPN Server - https://ubuntu.com/blog/setup-your-own-vpn-server
- [ ] Set up a sandbox environment (e.g., VirtualBox VM) for building/testing dotfiles.

## Helpful links

- https://dev.to/asifzcpe/resetting-mysql-root-password-in-ubuntu-a-step-by-step-guide-3gnd
- https://docs.flutter.dev/get-started/install/linux
- https://github.com/github/scripts-to-rule-them-all/tree/master
- https://williamjturkel.net/2013/05/31/installing-debian-linux-in-a-vm/
- https://medium.com/platform-engineer/how-to-install-debian-linux-on-virtualbox-with-guest-additions-778afa0ee7e0
- https://github.com/yesmeck/tmuxrc
- https://github.com/ninrod/dotfiles
- https://github.com/mtscout6/dotfiles
- https://github.com/nanotech/jellybeans.vim
- https://github.com/ryanpcmcquen/linuxTweaks/blob/master/.vimrc
- https://github.com/tao12345666333/vim
- https://github.com/carlhuda/janus
- https://github.com/christoomey/vim-tmux-navigator
- http://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits
- https://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim#14300487
- https://github.com/tpope/vim-unimpaired

## Contributing

Please take a moment to look through the /docs directory before you make any contributions. It will help you understand how things work and make your contribution easier.

# My dotfiles

I maintain this repo slowly, mainly to support my Vim development workflow.

Posting an issue works, but emailing me at mabinajoshua@gmail.com will usually get a faster response.

Optimized for Ubuntu 22.04 and tailored for:

- Dart and Flutter development
- Laravel-PHP development
- React development
- Python development

## Design decisions and philosophy

TODO

## Inspiration

- https://github.com/thoughtbot/dotfiles
- https://github.com/citypaul/.dotfiles
- https://github.com/ninrod/dotfiles
- https://github.com/mtscout6/dotfiles


## Server setup

If you use Vim on the server, install latest git, tmux, zsh and vim

```
sudo apt-get install -y git tmux zsh vim
```

TODO:

You might also want to check:

- basic.vimrc
- basic.zshrc

## Before setting up locally

Install latest git, tmux, and zsh


```
sudo apt-get install -y git tmux zsh
```

## Terminal setup

TODO: Install and setup terminal, ohmyzsh, tmux

## Vim

### Installing Vim 9 on Ubuntu 22.04

Run the script below to install Vim 9 from source.

```
./install/lib/vim.sh
```

### Installing and adding a Vim plugin

1. Clone the plugin GitHub repo as a git submodule, `git submodule add --depth=1 [plugin-git-url] [_vim/pack/plugins/start/]`

2. Stage, commit, and push changes for review and merging.

### Vim dependencies

- https://github.com/ctrlpvim/ctrlp.vim
- https://github.com/tpope/vim-commentary
- https://github.com/tpope/vim-surround
- https://github.com/sheerun/vim-polyglot
- https://github.com/vim-airline/vim-airline
- https://github.com/github/copilot.vim
- https://github.com/editorconfig/editorconfig-vim
- https://github.com/madox2/vim-ai

## Flutter/Dart development

TODO

## Laravel-PHP development

I use Laravel for my PHP work and I run everything in containers. That decision removes the need to install PHP locally or manage versions with tools like phpenv.

This note exists mainly for archival context. I’ve moved away from building PHP from source and juggling multiple local runtimes. Docker and Laravel Sail now define the entire environment

## TODOs

- [ ] basic.vimrc: Vim with zero configuration.
- [ ] tmux: Installation and configuration.
- [ ] ohmyzsh: Installation and configuration.
- [ ] Create install scripts for tmux.
- [x] Create install scripts for Vim.
- [x] Create install scripts for nvm.
- [ ] Create install scripts for docker.
- [ ] Create install scripts for oh-my-zsh.
- [ ] dart-flutter: Support for fvm and Vim.
- [ ] python: Installation and configuration, Vim support, virtualenv support.
- [ ] Create install scripts for [phpMyAdmin (using Docker)](https://docs.phpmyadmin.net/en/latest/setup.html#installing-using-docker)
- [ ] Set up a sandbox environment (e.g., VirtualBox VM) for building/testing dotfiles.

## Helpful links

- [Vim and Python: A Match Made in Heaven](https://realpython.com/vim-and-python-a-match-made-in-heaven)
- https://docs.flutter.dev/get-started/install/linux
- https://github.com/github/scripts-to-rule-them-all/tree/master
- https://williamjturkel.net/2013/05/31/installing-debian-linux-in-a-vm/

## Contributing

This was written for a very specific use case and won’t fit everyone. That’s intentional. That said, if you see a way to improve it or adapt it, contributions are welcome.

Fork the repository, make your changes, and open a pull request.

## LICENSE

This project is licensed under the MIT License.

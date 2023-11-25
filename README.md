# My dotfiles

Optimized for Ubuntu 22.04

## Supported features:

- [x] tmux
- [x] Oh-My-Zsh https://ohmyz.sh/
- [x] NVM-Node
- [x] PHP-Laravel
- [ ] @ctrlpvim/ctrlp.vim
- [ ] @editorconfig/editorconfig-vim
- [ ] @mxw/vim-jsx
- [ ] @pangloss/vim-javascript
- [ ] @prettier/vim-prettier
- [ ] @tpope/commentary
- [ ] @tpope/vim-surround
- [ ] @vim-airline/vim-airline

## Before setting up

Install latest git, tmux, zsh and vim


```
sudo apt-get install -y git tmux zsh vim 
```

## Install php-laravel

Refer to:

https://www.digitalocean.com/community/tutorials/how-to-install-php-8-1-and-set-up-a-local-development-environment-on-ubuntu-22-04

```
sudo apt-get update && sudo apt-get -y dist upgrade


sudo apt-get install -y apache2

# sudo service apache2 status


sudo apt-get install -y mysql-server

sudo mysql 

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
FLUSH PRIVILEGES;
# test: SELECT user,authentication_string,plugin,host FROM mysql.user;

# doc: Incase of any issues, completely uninstall and repeat. https://www.digitalocean.com/community/questions/completely-uninstall-mysql-server


sudo apt-get install --no-install-recommends php8.1

# test: php -v

sudo apt-get install -y libapache2-mod-php php8.1-common php8.1-cli \ 
php8.1-mysql php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml

# test: php -m
# todo: php8.1-bcmath php8.1-zip 


curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# test: composer


composer global require laravel/installer
```


## Install node-nvm

Install nvm. Refer to: https://github.com/nvm-sh/nvm

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# test: command -v nvm

nvm install node

# test: node

```

## Install dotfiles 

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

- Install dmenu - https://github.com/stilvoid/dmenu
- Deprecate LINKS.md
- Remove vim-fugitive. Use basic git commands.
- Maybe, [\_vim/pack/start/plugin-name]
- Installing submodules with a shallow clone?
- Extract basic configurations to basic.vimrc plugin
- Install script for tmux
- Install script for zsh
- Install script for ohmyzsh
- Add bash aliases: source, update-zsh update-bash

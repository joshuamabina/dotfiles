# Before setting up

Install latest git, tmux, zsh and vim


```
sudo apt-get install -y git tmux zsh vim 
```

# Install php-laravel

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


# Install node-nvm

Install nvm. Refer to: https://github.com/nvm-sh/nvm

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# test: command -v nvm

nvm install node

# test: node

```

# Install dotfiles 

Clone this repo

```
git clone --recurse-submodules -j8 https://github.com/joshuamabina/dotfiles.git ~/.dotfiles
```

Setup tmux

```
ln -sf ~/.dotfiles/_tmux.conf ~/.tmux.conf
```

Setup ohmyzsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp ~/dotfiles/_zshrc ~/.zshrc

rm ~/.bashrc
```

Setup vim

```
ln -sf ~/.dotfiles/_vimrc ~/.vimrc && ln -sf ~/.dotfiles/_vim ~/.vim
```

##### Adding a Vim plugin

1. Create a new directory to hold the plugin, `mkdir -p [_vim/pack/plugin-author/start]`
2. Clone the plugin GitHub repo as a git submodule, `git submodule add [plugin-git-url] [_vim/pack/plugin-author/start/plugin-name]`
3. Stage, commit, and push changes for review and merging.

# Ideas, todos, and feature requests

- Flatpak + Stremio - `flatpak install flathub com.stremio.Stremio`
- Python + Python env
- zshaliases - downloadyt - cleanup the youtube url - remove `&pp=%` just use `v=%` or `list=%` where appropriate.
- jq https://github.com/bobbyiliev/introduction-to-bash-scripting/blob/main/ebook/en/content/018-working-with-json-in-bash-using-jq.md
- Use vim-plug in favor of git-submodules. https://github.com/junegunn/vim-plug
- Kotlin for serverside https://kotlinlang.org/docs/server-overview.html
- Setup a sandbox (like a virtualbox-vm) for building/testing dotfiles
- Install vimb - https://github.com/fanglingsu/vimb.git
- Emma gui mysql https://github.com/clayadavis/emma
- Setup react-native expo
- Setup flutter - https://docs.flutter.dev/get-started/install/linux
- Extract basic configurations to basic.vimrc plugin
- Install and manage specific versions of php and apache
- Install scripts: php, apache, tmux, ohmyzsh, vim

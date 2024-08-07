# My dotfiles

Currently optimized for Ubuntu 22.04 (also, plans exists for Debian).

TODO: (1) basic.vimrc - vim config for stable/stock Vim
TODO: (2) build.vimrc - vim config for build latest source

My goal is to fine-tune these configurations for seamless setup and execution within seconds. Specifically tailored for the following use cases and platforms:

- React, redux and jest tools
- Laravel-PHP code development
- Flutter code writing and testing on Android
- React Native (Expo) for mobile app development
- Python code and library writing

TODO: Create a roadmap table to describe the implementation of the above, also marking their priorities and date to completion.

Some gotchas:

- This project is trying to keep things lean, so we've opted for Vim 8's native package manager.
- This repo uses git submodules to manage dependencies. So, don't forget to run `git submodule update`.

To kick things off, take a look at the [docs.md](./docs.md) file. For a ideas, todos and a product roadmap, see [todos.md](./todos.md) file.

On the server:

- ohmyzsh
- vimrc

## Supported features:

- [x] tmux

- [x] Oh-My-Zsh https://ohmyz.sh/

- [x] NVM-Node

- [ ] React things

  - [x] Syntax highlighting
  - [ ] Basic boilerplates
  - [ ] Code completion

- [x] PHP-Laravel

- [ ] Dart and flutter things

  - [ ] FVM 
  - [ ] Syntax highlighting
  - [ ] Dart-specific code formatting
  - [ ] Basic boilerplates
  - [ ] Code completion

- [ ] Python - https://realpython.com/vim-and-python-a-match-made-in-heaven 

  - [x] Syntax highlighting
  - [x] PEP 8 builtin support
  - [ ] Autofix PEP8 errors
  - [ ] Python virtual environments support
  - [ ] Basic boilerplates
  - [ ] Code completion

- [ ] Kotlin things

  - [ ] sdkman

- [ ] Vim things

  - [x] @ctrlpvim/ctrlp.vim
  - [ ] Compile with clipboard support
  - [ ] FIX: manpath: can't set the locale; make sure `$LC_*` and `$LANG` are correct
  - [ ] **WIP:** @editorconfig/editorconfig-vim
  - [x] @mxw/vim-jsx
  - [x] @pangloss/vim-javascript
  - [ ] **WIP:** @prettier/vim-prettier
  - [x] @tpope/commentary
  - [x] @tpope/vim-surround
  - [x] @vim-airline/vim-airline

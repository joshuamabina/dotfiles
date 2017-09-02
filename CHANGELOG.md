# Changelog

All notable changes to this project will be documented in this file.

> The format is based on [Keep a Changelog](1)

> This project adheres to [Semantic Versioning](2)

## [Unreleased]

### Added
- Automatically source the `.vimrc` after saving.
- Separate sources.list for elasticsearch package.
- Separate sources.list for dotdeb packages
- Hotkey to edit $MYVIMRC on a vertical split.
- Hotkey to write a file as sudo, case I forgot to open the file as sudo.

### Changed
- Group all general vim configurations in  _vim/general.vim
- Group plugins in _vim/rc/plugins/plugin/
- Rename apt/ to sources.list.d/

[1]: http://keepachangelog.com/en/1.0.0/
[2]: http://semver.org/spec/v2.0.0.html

[Unreleased]: https://github.com/joshuamabina/dotfiles/compare/v1.0.0...HEAD

#!/usr/bin/env bash

set -ue

function helpmsg() {
	print_default "Usage: ${BASH_SOURCE[0]:-$0} [--gui] [--arch] [--all] [--help | -h]" 0>&2
	print_default '  --all: --gui + --arch'
	print_default ""
}

function main() {
	local current_dir
	current_dir=$(dirname "${BASH_SOURCE[0]:-$0}")

	source "${current_dir}"/lib/utils.sh

  ## TODO: Install EditorConfig

  ## TODO: Install Prettier

  ## TODO: Install Python
}

main "$@"

#!/bin/bash

curl https://mise.run | sh

if [ ! -d ~/.etc ]; then
  git clone --recursive https://github.com/ChipWolf/dotfiles.git ~/.etc
fi

DEBIAN_FRONTEND=noninteractive sudo apt update
DEBIAN_FRONTEND=noninteractive sudo apt install -yq tmux

~/.etc/link.sh/link.sh -u ~/.etc/.link.conf -wf

mise trust
mise install

cat <<EOF > ~/.gitconfig.overrides
[user]
	name = Chip Wolf ‮
[gpg]
	program = /.codespaces/bin/gh-gpgsign
EOF

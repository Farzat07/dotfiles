#!/usr/bin/env sh

if [ ! -d "$XDG_DATA_HOME/tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm "$XDG_DATA_HOME/tmux/plugins/tpm"
	"$XDG_DATA_HOME/tmux/plugins/tpm/bin/install_plugins"
fi

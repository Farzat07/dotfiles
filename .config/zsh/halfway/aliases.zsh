# Edit bash history.
alias mbashhistory='${EDITOR:-nvim} ~/.bash_history'
# Edit zsh history.
alias mhistory='${EDITOR:-nvim} $ZDOTDIR/.zsh_history'
# Edit and view using ${EDITOR:-nvim}.
alias v='${EDITOR:-nvim}'
alias edit='${EDITOR:-nvim}'
alias view='${EDITOR:-nvim} -M'
# Edit zshrc.
alias mzshrc='${EDITOR:-nvim} -S "$ZDOTDIR/Session.vim"'
# Edit ${EDITOR:-nvim} configuration files.
alias mvimrc='${EDITOR:-nvim} -S "$XDG_CONFIG_HOME/nvim/Session.vim"'
# List swap files
alias ls-swap='la "${XDG_STATE_HOME:-$HOME/.local/state}/nvim/swap/"'
# Edit the ledger file.
alias mledger='${EDITOR:-nvim} -S $XDG_DATA_HOME/ledger/Session.vim'
# Edit all files in git dir.
alias vgit='git ls-files -z | xargs -0 ${EDITOR:-nvim}'
# Suspend the machine.
alias ssuspend='systemctl suspend'
# Restore cursor to original colour and transparent behaviour before wal.
alias restore_cursor="printf '%b' '\e]12'"
# General.
alias la='ls -lAh --color=auto'
# Pacman categorize packages.
alias pacman-orphan='pacman -Qtdq'
alias pacman-explicit-native='pacman -Qneq'
alias pacman-explicit='pacman -Qeq'
alias pacman-optional='comm -3 <(pacman -Qttq | sort) <(pacman -Qtteq | sort)'

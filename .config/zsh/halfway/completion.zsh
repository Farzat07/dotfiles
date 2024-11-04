# Make completion case insensitive.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Disable sort when completing `git checkout`.
zstyle ':completion:*:git-checkout:*' sort false
# Set descriptions format to enable group support.
zstyle ':completion:*:descriptions' format '[%d]'
# Set list-colors to enable filename colorizing.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Preview directory's content with eza when completing cd.
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# Switch group using `,` and `.`.
zstyle ':fzf-tab:*' switch-group ',' '.'

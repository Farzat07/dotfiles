typeset -A ZI
ZI[HOME_DIR]="${XDG_STATE_HOME:-$HOME/.local/state}/zi"
source "$ZDOTDIR/zi.init.zsh" && zzinit

# Load all of your early custom configurations.
function {
local config_file
for config_file ("$ZDOTDIR"/early/*.zsh(N)); do
	source "$config_file"
done
}

zi light "https://github.com/romkatv/powerlevel10k.git"
zi snippet "https://github.com/ohmyzsh/ohmyzsh/raw/master/plugins/vi-mode/vi-mode.plugin.zsh"
zi ice lucid wait has="fzf"
zi light "https://github.com/Aloxaf/fzf-tab.git"
zi ice blockf from="cgit.farzat.xyz"
zi load "dotfiles/my-zsh-completions"
zi ice lucid wait blockf
zi load "https://github.com/zsh-users/zsh-completions.git"
zi ice lucid wait
zi light "https://github.com/z-shell/F-Sy-H.git"
zi ice lucid wait as'completion' blockf has'man'
zi snippet "$ZDOTDIR/resources/completion/_man"

# Load all of your custom configurations.
function {
local config_file
for config_file ("$ZDOTDIR"/halfway/*.zsh(N)); do
	source "$config_file"
done
}

# Load zsh completion.
autoload -Uz compinit
compinit
# Load completions saved by zi till now.
zi cdreplay -q

# Load powerlevel10k configurations.
source "$ZDOTDIR/manual/p10k.zsh"

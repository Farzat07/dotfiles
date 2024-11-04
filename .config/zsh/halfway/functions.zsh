# Creates the given directories and then moves to the first one.
mkcd() {
	mkdir -p "$@";
	cd "$1";
}

# Create python directories with __init__.py.
mkdirpython() {
	mkdir -p "$@";
	local directory
	for directory in "$@";
	do touch "$directory/__init__.py";
	done;
}

# Switch from the current directory to the equivalent directory on another drive.
sd() {
	local wd="$(pwd)";
	wd="${wd/"$1"/"$2"}";
	printf %s\\n "$wd";
	cd "$wd";
}

# Copy the current directory to the clipboard.
pcopy() {
	printf %s "$(pwd)" | cclip
	pwd
}

vinfo() {
	INFOPATH="$XDG_DATA_HOME/info:$INFOPATH" ${EDITOR:-nvim} -R -M -c "Info $@" +only
}

vn3() {
	if [ "$#" -gt 0 ]; then
		local direc="$(printf %q "$1")"
		shift
		${EDITOR:-nvim} -c "NnnExplorer $direc" "$@"
	else
		${EDITOR:-nvim} -c NnnExplorer
	fi
}

# https://github.com/ohmyzsh/ohmyzsh/blob/8487a55/lib/cli.zsh#L625
src () {
	# Delete current completion cache
	command rm -f $_comp_dumpfile $ZSH_COMPDUMP

	# Old zsh versions don't have ZSH_ARGZERO
	local zsh="${ZSH_ARGZERO:-${functrace[-1]%:*}}"
	# Check whether to run a login shell
	[[ "$zsh" = -* || -o login ]] && exec -l "${zsh#-}" || exec "$zsh"
}

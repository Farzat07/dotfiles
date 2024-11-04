# Run the sequences in the current terminal to apply the theme.
# The first is synchronous, the second is asynchronous.
cat ~/.cache/wal/sequences;
# (cat ~/.cache/wal/sequences &);
# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
# Attempts to restore the cursor colour - harmless, usually doesn't work
# but sometimes it is actually the only thing that works.
printf '%b' '\e]12'

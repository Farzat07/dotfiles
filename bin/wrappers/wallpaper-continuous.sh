#!/usr/bin/env sh

while true; do
	wal -a 1 -i "$XDG_DATA_HOME/farzat_wallpapers" --backend haishoku
	rm ~/.fehbg
	gen_zathura_wal_config
	sleep 60
done

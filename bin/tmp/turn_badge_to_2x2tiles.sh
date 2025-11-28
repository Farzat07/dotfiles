#!/usr/bin/env sh

# Half the height and width of an image or pdf page by making it into 2x2 tiles.
# The first argument is the input file. Could be an image or a pdf.
# The second argument is the output filename. It is optional. Default is output.png.

if [ "${1%.pdf}" != "$1" ]; then
	img_name="$(mktemp --suffix=.png)"
	magick -density 300 "${1}[0]" "$img_name"
else
	img_name="$1"
fi

if [ -n "$2" ]; then
	output_file="$2"
else
	output_file="output.png"
fi
montage "$img_name" "$img_name" "$img_name" "$img_name" -tile 2x2 -geometry +0+0 "$output_file"

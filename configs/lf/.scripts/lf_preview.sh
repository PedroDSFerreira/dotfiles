#!/usr/bin/env bash

# WARNING: script requires mime-types, bat, timg, pdftotext, 7z, unrar, unzip and tar pkgs

MIME=$(mimetype --all --brief "$1")

case "$MIME" in
# .pdf
*application/pdf*)
	pdftotext "$1" -
	;;
# .7z
*application/x-7z-compressed*)
	7z l "$1"
	;;
# .tar .tar.Z
*application/x-tar*)
	tar -tvf "$1"
	;;
# .tar.*
*application/x-compressed-tar* | *application/x-*-compressed-tar*)
	tar -tvf "$1"
	;;
# .rar
*application/vnd.rar*)
	unrar l "$1"
	;;
# .zip
*application/zip*)
	unzip -l "$1"
	;;
# images
*image/*)
	timg -g 80x20 "$1" | sed 's/\[?25h//g'
	;;
# any plain text file that doesn't have a specific handler
*)
	# return false to always repaint, in case terminal size changes
	bat --force-colorization --paging=never --style=changes,numbers \
		--terminal-width $(($2 - 3)) "$1" && false
	;;
esac

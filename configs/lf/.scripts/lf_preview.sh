#!/usr/bin/env bash

# WARNING: script requires mime-types, bat, timg, pdftotext and lsar

MIME=$(mimetype --all --brief "$1")

case "$MIME" in
# .pdf
*application/pdf*)
	pdftotext "$1" -
	;;
# compressed files
*application/*compressed* | *application/*zip* | *application/*rar* | *application/*tar*)
	lsar "$1"
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

#/bin/sh

while IFS= read -r line; do
    ya pack -a $line
done < "$HOME/.config/yazi/packages.txt"

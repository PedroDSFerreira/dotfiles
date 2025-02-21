#/bin/sh

while IFS= read -r line; do
    ya pack -a $line
done < "packages.txt"

if [ -z "$1" ]; then
	echo "Usage: mk.sh <path>"
	exit 1
fi

if [[ $1 == *"/"* ]]; then
	mkdir -p $(sed 's/\(.*\)\/.*/\1/' <<<$1) && touch $1
else
	touch $1
fi
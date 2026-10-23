#!/bin/bash

# dir_char=`~/messy_downloads/*`

for a in ~/messy_downloads/*; do

	name=`basename "$a"`
	filename="${name}"
	if [[ "$a" == *.* ]]; then
		extend="${a##*.}"
		echo "$filename ($extend)"
	else

		echo "$filename"
	fi

done

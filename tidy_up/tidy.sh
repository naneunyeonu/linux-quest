#!/bin/bash

argu=$1

if [ $# -ne 1 ]; then
	echo "使い方: ./tidy.sh ディレクトリ" >&2
	exit 1
fi

if [ ! -d "$argu" ]; then
	echo "エラー: $argu はディレクトリではありません" >&2
	exit 1
fi

for a in "$argu"/*; do

	name=`basename "$a"`
	filename="${name}"
	extend="${a##*.}"
	small_extend="${extend,,}"
	
	if [ -f "$a" ]; then

        case "$small_extend" in
            jpg | jpeg | png | gif)
                # mv to images/
                mkdir -p "$argu/images"
                mv "$a" "$argu/images/" 
                echo "$filename -> images/" ;;

            pdf | txt | md | docx)
                # mv to documents/
                mkdir -p "$argu/documents"
                mv "$a" "$argu/documents/"  
                echo "$filename -> documents/" ;;

            mp3 | wav)
                # mv to music/
                mkdir -p "$argu/music"
                mv "$a" "$argu/music/"  
                echo "$filename -> music/" ;;
            
            zip | gz)
                #mv to archives/
                mkdir -p "$argu/archives" 
                mv "$a" "$argu/archives/"  
                echo "$filename -> archives/" ;;

            *)
                # mv to others/
                mkdir -p "$argu/others"
                mv "$a" "$argu/others/"  
                echo "$filename -> others/" ;;

        esac

    fi

done

exit 0

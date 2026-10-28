#!/bin/bash


for a in ~/messy_downloads/*; do

	name=`basename "$a"`
	filename="${name}"
	extend="${a##*.}"

	if [ -f "$a" ]; then

		case "$extend" in
			jpg | jpeg | png | gif)
				# mv to images/
				# echo "mv to images/" 
				mkdir -p "$HOME/messy_downloads/images"
				mv "$a" "$HOME/messy_downloads/images/" 
				echo "$filename -> images/" ;;

			pdf | txt | md | docx)
				# mv to documents/
				# echo "mv to documents/" 
				mkdir -p "$HOME/messy_downloads/documents"
				mv "$a" "$HOME/messy_downloads/documents/"  
				echo "$filename -> documents/" ;;

			mp3 | wav)
				# mv to music/
				# echo  "mv to music/" 
				mkdir -p "$HOME/messy_downloads/music"
				mv "$a" "$HOME/messy_downloads/music/"  
				echo "$filename -> music/" ;;
			
			zip | gz)
				#mv to archives/
				# echo "mv to archives/" 
				mkdir -p "$HOME/messy_downloads/archives" 
				mv "$a" "$HOME/messy_downloads/archives/"  
				echo "$filename -> archives/" ;;

			*)
				# mv to others/
				# echo "mv to others/"
				mkdir -p "$HOME/messy_downloads/others"
				mv "$a" "$HOME/messy_downloads/others/"  
				echo "$filename -> others/" ;;

		esac

	fi

done

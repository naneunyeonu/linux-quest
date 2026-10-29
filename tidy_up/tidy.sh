#!/bin/bash

# if --dry-run
if [ $1 == "--dry-run" ]; then
    echo "dry running ..."
    shift 1
    
    # dry run
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
        cnt=1
        
        if [ -f "$a" ]; then

            case "$small_extend" in
                jpg | jpeg | png | gif)
                    # destination setting
                    dest="images/" ;;

                pdf | txt | md | docx)
                    # destination setting
                    dest="documents/" ;;

                mp3 | wav)
                    # destination setting
                    dest="music/" ;;
                
                zip | gz)
                    # destination setting
                    dest="archives/" ;;

                *)
                    # destination setting
                    dest="others/" ;;

            esac

            # 上書きを防ぐ 
            # 最終目的地 findes
            findes="$argu/$dest$filename"
            while [ -e "$findes" ]; do    
                findes="$argu/$dest${filename%.*}_${cnt}.${filename##*.}"
                ((cnt++))
            done    

            if [ $cnt -eq 1 ]; then
                #   重複なし
                echo "[dry-run] $filename -> $dest"
            fi
            
            if [ $cnt -ne 1 ]; then
                # 重複あり
                echo "[dry-run] $filename -> ${findes:${#argu}+1}"
            fi

        fi

    done

    exit 0    

else
    # no --dry-run
    echo "no dry running ..."

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
        cnt=1
        
        if [ -f "$a" ]; then

            case "$small_extend" in
                jpg | jpeg | png | gif)
                    # destination setting
                    dest="images/" ;;

                pdf | txt | md | docx)
                    # destination setting
                    dest="documents/" ;;

                mp3 | wav)
                    # destination setting
                    dest="music/" ;;
                
                zip | gz)
                    # destination setting
                    dest="archives/" ;;

                *)
                    # destination setting
                    dest="others/" ;;

            esac

            mkdir -p "$argu/$dest"

            # 上書きを防ぐ 
            # 最終目的地 findes
            findes="$argu/$dest$filename"
            while [ -e "$findes" ]; do    
                findes="$argu/$dest${filename%.*}_${cnt}.${filename##*.}"
                ((cnt++))
            done    

            mv "$a" "$findes"

            if [ $cnt -eq 1 ]; then
                #   重複なし
                echo "$filename -> $dest"
            fi
            
            if [ $cnt -ne 1 ]; then
                # 重複あり
                echo "$filename -> ${findes:${#argu}+1}"
            fi

        fi

    done

    exit 0

fi





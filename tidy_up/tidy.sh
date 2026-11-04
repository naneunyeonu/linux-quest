#!/bin/bash

# if --dry-run
dryrun_mode=0
if [ "$1" == "--dry-run" ]; then
    shift 1
    dryrun_mode=1
fi 

argu=$1

if [ $# -ne 1 ]; then
    echo "使い方: ./tidy.sh ディレクトリ" >&2
    exit 1
fi

if [ ! -d "$argu" ]; then
    echo "エラー: $argu はディレクトリではありません" >&2
    exit 1
fi

cnt_img=0 cnt_doc=0 cnt_music=0 cnt_arch=0 cnt_others=0
if_error=0

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
                # ((cnt_img++))
                dest="images/" ;;

            pdf | txt | md | docx)
                # destination setting
                # ((cnt_doc++))
                dest="documents/" ;;

            mp3 | wav)
                # destination setting
                # ((cnt_music++))
                dest="music/" ;;
            
            zip | gz)
                # destination setting
                # ((cnt_arch++))
                dest="archives/" ;;

            *)
                # destination setting
                # ((cnt_others++))
                dest="others/" ;;

        esac

        # no dry-run
        if [ $dryrun_mode -eq 0 ]; then
            mkdir -p "$argu/$dest" 2>/dev/null
        fi

        # 上書きを防ぐ 
        # 最終目的地 findes
        findes="$argu/$dest$filename"
        if [ "${filename##*.}" = "${filename}" ]; then
            # no expand
            while [ -e "$findes" ]; do    
                findes="$argu/$dest${filename%.*}_${cnt}"
                ((cnt++))
            done    
        else
            while [ -e "$findes" ]; do    
                findes="$argu/$dest${filename%.*}_${cnt}.${filename##*.}"
                ((cnt++))
            done 
        fi
   

        # no dry-run
        if [ $dryrun_mode -eq 0 ]; then
            mv "$a" "$findes" 2>/dev/null
            if [ $? -ne 0 ]; then
                # エラー
                echo "エラー: $filename の移動に失敗しました。" >&2
                if_error=1
                continue
            fi
        fi
        
        # mvの成功、dry-run
        case "$dest" in
            "images/")
                ((cnt_img++)) ;;
            "documents/")
                ((cnt_doc++)) ;;
            "music/")
                ((cnt_music++)) ;;
            "archives/")
                ((cnt_arch++)) ;;
            "others/")
                ((cnt_others++)) ;;
        esac

        if [ $dryrun_mode -eq 1 ]; then
            # only dry-run
            if [ $cnt -eq 1 ]; then
                # 重複なし
                echo "[dry-run] $filename -> $dest"
            else
                # 重複あり
                echo "[dry-run] $filename -> ${findes:${#argu}+1}"
            fi
        else
            if [ $cnt -eq 1 ]; then
                # 重複なし
                echo "$filename -> $dest"
            else
                # 重複あり
                echo "$filename -> ${findes:${#argu}+1}"
            fi
        fi
        

    fi

done

# 結果をまとめる
echo "----"
echo "images: $cnt_img 件"
echo "documents: $cnt_doc 件"
echo "music: $cnt_music 件"
echo "archives: $cnt_arch 件"
echo "others: $cnt_others 件"

exit $if_error
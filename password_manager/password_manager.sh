#!/bin/bash

echo パスワードマネージャーへようこそ！
echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit):"
read option

while [[ "$option" != "Exit" ]]; do
    if [ "$option" == "Add Password" ]; then
        echo -n サービス名を入力してください：
        read service_name

        echo -n ユーザー名を入力してください：
        read user_name

        echo -n パスワードを入力してください：
        read passwd

        echo "$service_name:$user_name:$passwd" >> ./result.txt
        echo "パスワードの追加は成功しました。"
        
        echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit):"
        read option
    elif [ "$option" == "Get Password" ]; then
        echo -n サービス名を入力してください：
        read service_name

        # 入力されたサービスの情報を出力
        # サービス名が保存されている場合
        if grep -qw $service_name result.txt; then
            echo "サービス名: $(grep -w $service_name result.txt | cut -d ":" -f1)"
            echo "ユーザー名: $(grep -w $service_name result.txt | cut -d ":" -f2)"
            echo "パスワード: $(grep -w $service_name result.txt | cut -d ":" -f3)"
        else
            echo そのサービスは登録されていません。
        fi

        echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit):"
        read option
    elif [ "$option" == "Exit" ]; then
        break
    else
        echo 入力が間違えています。Add Password/Get Password/Exit から入力してください。
        echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit):"
        read option
        continue
    fi
done

# 入力が完了したら
echo Thank you!
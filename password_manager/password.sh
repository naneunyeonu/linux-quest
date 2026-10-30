#!/bin/bash

echo パスワードマネージャーへようこそ！

echo -n サービス名を入力してください：
read service_name

echo -n ユーザー名を入力してください：
read user_name

echo -n パスワードを入力してください：
read passwd

echo "$service_name:$user_name:$passwd" >> ./result.txt


# 入力が完了したら
echo Thank you!
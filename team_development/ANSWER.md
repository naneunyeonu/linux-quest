# ひとりチーム開発

- GitHub の linux-quest リポジトリの URL
    - https://github.com/naneunyeonu/linux-quest

- PRのURL
    - ステップ４のPR URL: https://github.com/naneunyeonu/linux-quest/pull/1
    - ステップ５のPR URL: https://github.com/naneunyeonu/linux-quest/pull/2
    - ステップ６のPR URL: https://github.com/naneunyeonu/linux-quest/pull/3

## ステップ１
```bash
ssh-keygen -t ed25519 -C "evan2011@naver.com"

cd .ssh/
ls
cat id_ed25519.pub
ssh -T git@github.com
ls -al
```

![ステップ１−１](images/1-1.png)
![ステップ１−2](images/1-2.png)
![ステップ１−3](images/1-3.png)
![ステップ１−4](images/1-4.png)

### 質問１−１：作成された 2 つの鍵ファイルは、それぞれ何ですか。他人（GitHub を含む）に渡してよいのはどちらですか
- 二つの鍵ファイルは、id_ed25519、id_ed25519.pubです。
- id_ed25519です。

### 質問１−２: 秘密鍵ファイルのパーミッションはどうなっていますか。なぜそのような設定になっているのですか
- -rw-------です。
- 所有者だけが使うためです。また、他のユーザーには隠すためです。

## ステップ２
```bash
git remote add git@github.com:naneyeonu/linux-quest.git
git remote -v

git push -u origin main
```

![ステップ２−１](images/2-1.png)
![ステップ２−２](images/2-2.png)
![ステップ２−３](images/2-3.png)
![ステップ２−４](images/2-4.png)

## ステップ３
```bash
mkdir teammate
cd teammate

git clone git@github.com:naneyeonu/linux-quest.git

git remote -v
```

![ステップ３−１](images/3-1.png)
![ステップ３−２](images/3-2.png)

## ステップ４
```bash
git switch -c add-goal
git branch

vi README.md
git status
git diff README.md
git add README.md
git commit -m "研修のゴール"
git status

git branch -d add-goal
git push origin -d add-goal
git branch -a
```

> PRのURL
>   > https://github.com/naneunyeonu/linux-quest/pull/1

![ステップ４](images/4-1.png)
![ステップ４](images/4-2.png)
![ステップ４](images/4-3.png)
![ステップ４](images/4-4.png)
![ステップ４](images/4-5.png)
![ステップ４](images/4-6.png)
![ステップ４](images/4-7.png)
![ステップ４](images/4-8.png)
![ステップ４](images/4-9.png)

## ステップ５
```bash
git pull
git log --oneline
cat README.md

git switch -c add-links
git branch
vi README.md
git add README.md
git commit -m "参考リンク追加"
git status

git log --oneline
git push -u origin add-links

git switch main
git status
git branch -d add-links

warning: deleting branch 'add-links' that has been merged to
    'refs/remotes/origin/add-links', but not yet merged to HEAD
Deleted branch add-links (was 81762bc).

git branch
git pull
git log --oneline
cat README.md
```

> PRのURL
>   > https://github.com/naneunyeonu/linux-quest/pull/２

![ステップ５](images/5-1.png)
![ステップ５](images/5-2.png)
![ステップ５](images/5-3.png)
![ステップ５](images/5-4.png)
![ステップ５](images/5-5.png)
![ステップ５](images/5-6.png)

> warning: deleting branch 'add-links' that has been merged to
>    'refs/remotes/origin/add-links', but not yet merged to HEAD
> Deleted branch add-links (was 81762bc).

- add-linkブランチを削除する前にgit pullをしなかったら上記のwarningが出ました。
    - mainブランチにはまだadd-linksの作業が統合しなかったからです。
    しかし、事前にマージをしまいたので作業内容は残っています。

![ステップ４](images/5-7.png)
![ステップ４](images/5-8.png)

## ステップ６
```bash
git switch -c "update-status-teammate"
vi README.md
git add README.md
git commit -m "ステップ６−１"
```

![ステップ６](images/6-1.png)
![ステップ６](images/6-2.png)

```bash
git switch -c "update-status"
vi README.md
git add README.md
git commit -m "ステップ６−１main"
```

![ステップ６](images/6-3.png)
![ステップ６](images/6-4.png)

```bash
git push -u origin update-status-teammate
```

![ステップ６](images/6-5.png)

> PRのURL
>   > https://github.com/naneunyeonu/linux-quest/pull/3

![ステップ６](images/6-6.png)

```bash
git status
git branch
    main
    * update-status
git push 0u origin update-status
```

![ステップ６](images/6-7.png)

> PRのURL
>   > https://github.com/naneunyeonu/linux-quest/pull/4

![ステップ６](images/6-9.png)
![ステップ６](images/6-10.png)

```bash
git switch main
git branch
git pull
cat README.md
```

![ステップ６](images/6-11.png)

- コンフリクトの発生
```bash
git switch update-status
git status
git merge main
cat README.md

git add README.md
git status
git commit
git log --oneline --graph --all

git push
```

![ステップ６](images/6-12.png)
![ステップ６](images/6-13.png)
![ステップ６](images/6-14.png)
![ステップ６](images/6-15.png)
![ステップ６](images/6-16.png)

```bash
/work
git status
git switch main
git pull
git branch -d update-status
git branch -a

/root/teammate/linux-quest
git status
git switch main
git pull
git branch -d update-status-teammate
git push -d origin -d origin update-status-teammate
git branch -a
```

![ステップ６](images/6-17.png)
![ステップ６](images/6-18.png)

```bash
/work
git log --oneline --graph --all

/root/teammate/linux-quest
git log --oneline --graph --all
```

![ステップ６](images/6-19.png)
![ステップ６](images/6-20.png)

## ステップ７
### 質問７−１：リモートリポジトリとローカルリポジトリの違いは何ですか。git push、git pull、git clone はそれぞれ何をするコマンドですか
- リモートリポジトリはオンラインサーバーにあるリポジトリです。多数の人が共有します。
ローカルリポジトリは個人のPCにあるリポジトリです。一人で使います。

### 質問７−２：ブランチとは何ですか。なぜ main ブランチに直接コミットせず、ブランチを作って開発するのですか
- ブランチは既存のコードに影響を与えられず、作業ができる空間です。
多数のプログラマーが同時に開発できるし、新しいブランチを作っていくらでも修正やテストができるからです。

### 質問７−３：プルリクエストとは何ですか。何のためにあるのですか
- 自分が修正したコードをmainブランチに反映することをリクエストを送ることです。
ステップ６ようなコンフリクトを防止し、mainに反映する前にレビューができます。

### 質問７−４：GitHub フロー の公式ドキュメントを読み、GitHub フローの流れを自分の言葉で説明してください
- Githubフローはプログラミングの方法です。
まずブランチを生成して作業空間を確保します。そのブランチで作業を進みます。
そしてPRを通じてmainブランチに統合するかどうかを決定し、マージします。
マージの後は使ったブランチを削除します。マージの後はブランチがいらないからです。

### 質問７−５：コンフリクトとは何ですか。コンフリクトを起こりにくくするためには、どのような工夫ができますか
- 二人以上のプログラマーが同時に同じファイルの同じ部分を修正する状況です。
コンフリクトを防止するためにはブランチを最新にし、小さい単位でPRを進むことです。
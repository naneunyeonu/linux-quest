# Gitタイムマシン

## ステップ１
```bash
git config --global user.name "uda"

git config --global user.email "evan2011@naver.com"

git config --global init.defaultBranch main

git config list
```

![ステップ１git config list](images/step1-git-config-list.png)
---

## ステップ２
```bash
vi README.md
git add README.md
git status
git commit -m "READMEを追加"
git status
```

![ステップ２−１](images/step2-1.png)
![ステップ２−２](images/step2-2.png)

### 質問：README.md を作成した直後、ステージに追加した後、コミットした後で、Git から見た README.md の状態はそれぞれどのように表示されましたか。
- 作成した直後：Untracked filesと表されます。まだGitが管理しない状態です。
- ステージに追加した後：Changes to be committed状態になります。ステージに上がっている状態です。
- コミットした後：レポジトリに上がっている状態です。

---

## ステップ３
```bash
vi learning_log.md
vi README.md
git diff learning_log.md
git diff --cached
git commit -m "学んだこと"

git add README.md
git commit -m "好きなもの修正"
git log --oneline
git log -p
```

![ステップ３−１](images/step3-1.png)
![ステップ３−２](images/step3-2.png)
![ステップ３−３](images/step3-3.png)
![ステップ３−４](images/step3-4.png)


### 質問３−３：ステップ3-2で変更を確認したとき、ステージに追加する前と後で、表示がどう変わりましたか。ステージに追加した変更を確認するにはどうすればよいですか
- ステージに追加する前は赤い文字で、追加した後は緑文字で表されます。
- ステージに追加した変更を確認するには"git diff --cached"を使います。

### 質問３−４：ステップ3-2で変更を確認したとき、learning_log.md の内容は表示されましたか。その理由も答えてください
- "git diff"では表示されてなかったです。ただの"git diff"はワークツリーとステージの違いを表示するコマンドだからです。

---

## ステップ４
```bash
echo "Linux の QUEST を始めました" > README.md

git status
git diff README.md
git checkout -- README.md
git diff README.md
git status
```

![ステップ４−１](images/step4-1.png)
![ステップ４−２](images/step4-2.png)
---

## ステップ５
```bash
mkdir tmp
echo "作業用のメモ" > tmp/memo.txt
echo "debug info" > debug.log
echo "GitHub のパスワード: hogehoge" > secret.txt

git add .
```
---
```bash
git status
git restore --staged tmp
git restore --staged debug.log secret.txt
git status

git commit -m "ステップ５Commit"
git status
```
![ステップ５−１](images/step5-1.png)
![ステップ５−２](images/step5-2.png)

```bash
vi .gitignore
git add .gitignore
git status
git commit -m "gitignore追加"
```

![ステップ５−３](images/step5-3.png)
![ステップ５−４](images/step5-4.png)


### 質問５−６：もし secret.txt をコミットして GitHub にプッシュしていたら、どんなことが起きたでしょうか
- 隠すべきファイルが表示されるようになります。

---

## ステップ６
```bash
vi README.md
git status
git diff README.md
git add README.md
git status
git commit -m "READMEを整理"
```
![ステップ６−１](images/step6-1.png)

```bash
git log -p  # commitを探す
git show <commit hash>
git revert <commit hash>
cat README.md
```

![ステップ６−２](images/step6-2.png)
![ステップ６−３](images/step6-3.png)

- 自己紹介が戻ったあと”ステータス”を”Gitを練習中”に書き換える
```bash
vi README.md
git status
git diff README.md
git add README.md
git status
git commit -m "ステップ６−５"
git status
```

![ステップ６−４](images/step6-4.png)

### 質問６−４：README.md の中身と、コミットの履歴を確認してください。自己紹介は戻りましたか。また、「ステータス」はどうなりましたか
- 自己紹介も、ステータスも戻りました。

### 質問６−６：ステップ6-1のコミットのように、性質の違う複数の変更を 1 つのコミットにまとめてしまうと、どんな困ったことが起きるでしょうか。ステップ6-4の経験をもとに説明してください
- １つのコミットにまとめている全てが一挙に変化します。一部だけを修正したくても、１つのコミットにまとめている他のコードも一緒に影響をもらいます。

---

## ステップ７

### 質問１：Git とは何ですか。Git を使うと何が嬉しいのですか
- プログラムのコードやファイルの変更履歴を管理するシステムです。

### 質問２：ワークツリー、ステージ（インデックス）、リポジトリとは何ですか。git add と git commit で、変更はどこからどこへ移動しますか
- ワークツリ：ファイルが実際に存在するディレクトリです。
- ステージ（インデックス）：Gitリポジトリと作業ディレクトリの間にあるものです。
- リポジトリ：仮想の空間です。コミット履歴があります。

- "git add"は作業ディレクトリからステージへ、"git commit"はステージからレポジトリまで移動します。

### 質問３：なぜ「ステージ」という段階があるのですか。ステップ3とステップ5の経験をもとに答えてください
- 変更事項を確定する前に検討したり、間違えたことを直すために必要だと思います。

### 質問４：良いコミットメッセージ、良いコミットの単位とはどのようなものですか。ステップ6の経験をもとに答えてください
- 良いコミットメッセージはコミットの内容を上手く説明することです。
- 良いコミットの単位は一つの変更事項についてコミットすることです。一つのコミットにいくつかの変更事項が入ったら特定の部分について、元に戻すことができないからです。

### 質問５：.gitignore には、どのようなファイルを書くべきですか。例を 3 つ以上挙げてください
- 外部の人に見せてはいけないものです。
- 個人的なファイル、API Key、logファイルです。

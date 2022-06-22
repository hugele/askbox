# README

# アプリケーション名

Ask Box

# アプリケーション概要

登録したユーザー同士で質問や回答をやり取りするコミュニケーションアプリ

# アプリケーションを作成した背景

写真家として活動していた際、社内でクオリティーに関する疑問や共有を行う場がなく、クオリティーにばらつきがあった経験から着想しました。

在職中は月に一度、勉強会や MTG を行っていましたが、技術や疑問を共有できる環境をアプリで作ることで、個人と組織の両方の価値の向上につながることを想定して作成しました。

# URL

https://ask-box-app.herokuapp.com/

# テスト用アカウント

投稿者ユーザー名: test_user

email: test@user

passward: 1qazxsw

回答者ユーザー名：user_test

email:user@email

passward: wsxzaq1

# Basic 認証

ユーザー名: admin

password: 2222

# 利用方法

1 トップページから新規登録を行う

2 「質問投稿ボタン」からタイトル、質問内容を入力

3 トップページから質問タイトルをクリックし、詳細ページへ遷移し、回答ができる

4 ユーザー名をクリックすると、ユーザーが投稿した一覧が見れる

5 詳細ページから投稿の編集が行える

6 詳細ページから、質問が削除が行えます。

7 検索フォームでワード入力すると、「タイトル」「質問内容」からワードを検索し、検索結果画面へ遷移する。

# 今後の実装予定

検索ワードの範囲をタイトル「質問内容」の他に「回答」も含める。

社内や組織での利用を想定し、ユーザー登録時に「部署」などを追加し、部署ごとの詳細を見れるようにする。

文字数などを可視化するため、JavaScript で文字数カウント機能を実装する

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| name               | string | null: false              |

### Association

has_many :asks
has_many :comments

## ask テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| title   | string  | null: false |
| comment | text    | null: false |
| user_id | integer | null: false |

### Association

belongs*to*:user
has_many :comments

## comment テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| comment | text       | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :aks

# アプリケーションの挙動

### トップページの質問タイトルをクリックすると、内容と回答が表示されます。

[![Image from Gyazo](https://i.gyazo.com/c6eb75372558221395a1393d7d70d419.gif)](https://gyazo.com/c6eb75372558221395a1393d7d70d419)

### 検索機能を実装したことで、問題に直面した際にデータとして調べらることができます。

## トップページの質問タイトルをクリックすると、内容と回答が表示されます。

[![Image from Gyazo](https://i.gyazo.com/c6eb75372558221395a1393d7d70d419.gif)](https://gyazo.com/c6eb75372558221395a1393d7d70d419)

## 検索機能を実装したことで、問題に直面した際にデータとして調べらることができます。

[![Image from Gyazo](https://i.gyazo.com/fa2532a9b5d8d4615e22d0a3e8f1d3d3.gif)](https://gyazo.com/fa2532a9b5d8d4615e22d0a3e8f1d3d3)

# 開発環境

Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code

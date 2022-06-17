# README

# アプリケーション名

Ask Box

# アプリケーション概要

登録したユーザー同士で質問や回答をやり取りするコミュニケーションアプリ

# URL

# テスト用アカウント

# 利用方法

1 トップページから新規登録を行う

2 「質問投稿ボタン」からタイトル、質問内容を入力

3 トップページから質問タイトルをクリックし、詳細ページへ遷移し、回答ができる

4 ユーザー名をクリックすると、ユーザーが投稿した一覧が見れる

5 ユーザーページから投稿の削除が行える

# アプリケーションを作成した背景

写真家として活動していた際、社内で技術や案件に関する疑問や共有を行う場がなく、クオリティーにばらつきがあった経験から着想しました。

テクニカルな技術を社内で誰でも質問や共有できる環境をアプリでいつでもできることで、個人と組織の両方の価値の向上につながることを想定して作成しました。

また、一つ一つの投稿が財産だと考えているため、削除を機能は設けていません。

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

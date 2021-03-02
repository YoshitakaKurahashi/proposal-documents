#README
##アプリ名

##概要
(このアプリでできることを書いて下さい)

##本番環境
(デプロイ先テストアカウント＆ID)

##制作背景
(意図)
⇒どんな課題や不便なことを解決するためにこのアプリを作ったのか。

##DEMO
(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。

##工夫したポイント

##使用技術
(開発環境)

##課題や今後実装したい機能

##DB設計


# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| phone_number  | string  | null: false |
| occupation_id | integer | null: false |
| position_id   | integer | null: false |

### Association

 - has_many :proposals, through: users_proposals
 - has_many :users_proposals
 - has_many :comments
 - has_one  :like

## proposal テーブル

| Column       | Type    | Options      |
| ------------ | --------| ------------ |
| title        | string  | null: false  |
| detail       | text    | null: false  |
| term_start   | date    | null: false  |
| term_end     | date    | null: false  |
| target_group | string  | null: false  |
| numeric      | string  | null: false  |
| budget       | integer | null: false  |
| payment      | string  | null: false  |

### Association

 - has_many :users, through: users_proposals
 - has_many :users_proposals
 - has_many :comments
 - has_many :like

## users_proposals テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| proposal | references | null: false, foreign_key: true |

### Association

 - belongs_to :user
 - belongs_to :proposal

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | string     |                                |
| user     | references | null: false, foreign_key: true |
| proposal | references | null: false, foreign_key: true |

### Association

 - belongs_to :user
 - belongs_to :proposal

## likes テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| like     | string     |                                |
| user     | references | null: false, foreign_key: true |
| proposal | references | null: false, foreign_key: true |

### Association

 - belongs_to :user
 - belongs_to :proposal
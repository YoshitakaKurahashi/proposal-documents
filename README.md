# README
## アプリ名
 - Proposal Documents（プロポーサル　ドキュメント）


## 概要
 - 提案書や企画書などの内容をオンライン上で共有するアプリです。
 - 提案内容を登録することで決裁者が内容を確認することができます。
 - 確認した際に不備があればコメントで修正を依頼することもできます。
 - 提案書内容を確認し、不備が無さそうであれば確認ボタンを押し、作成者やメンバーに「確認済み」と意思表示することができます。


## 本番環境
 - https://proposal-documents-666.herokuapp.com/


## 制作背景
(意図)
⇒どんな課題や不便なことを解決するためにこのアプリを作ったのか。
 - 現在発生している会社での不便・不満を解決するために制作しました。
 <不便・不満>
 - - 現状紙ベースの企画書を使用しており関係者（決裁者）が会社に出社しないと内容のチェックができない。
 - - コロナ禍によりテレワークが始まり、関係者の出社率が下がり、内容の確認が遅れる事態が発生。
 - - さらにせっかく関係者が出社し確認をしても不備や修正点があると、また一からやり直しとなる。
 - - スピードが重視される中で、大事な企画内容の進捗が大幅に遅れることに社員も不満を漏らしていた。

 <ご参考>
 - - 


## DEMO
(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。


## 工夫したポイント



## 使用技術
(開発環境)


## 課題や今後実装したい機能



## DB設計





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
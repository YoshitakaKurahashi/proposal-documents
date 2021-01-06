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

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |

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
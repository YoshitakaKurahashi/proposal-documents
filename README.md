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

## proposal テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |

## users_proposals テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |
| proposal | references | null: false, foreign_key: true |

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | string     |                                |
| user     | references | null: false, foreign_key: true |
| proposal | references | null: false, foreign_key: true |

## likes テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| like     | string     |                                |
| user     | references | null: false, foreign_key: true |
| proposal | references | null: false, foreign_key: true |

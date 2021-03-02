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
   - 現状、紙ベースの企画書を使用しており関係者（決裁者）が会社に出社しないと内容のチェックができません。
   - コロナ禍によりテレワークが始まり、関係者の出社率が下がり、内容の確認が遅れる事態が度々発生しました。
   - さらにせっかく関係者が出社し確認をしても不備や修正点があると、また一からやり直しとなります。
   - スピードが重視される営業の世界で、大事な企画内容の進捗が大幅に遅れることに社員も不満を漏らしていました。
   （実際に同チームの同僚にヒアリングした結果、10人中9人が不満を感じていました）

 <ご参考>
   - このアプリで本来２週間掛かっていた決裁完了が半分で終了する場合、決裁や確認に関わる人の時間は１案件に対して15分程度削減出来ると想定。また1年間に５０案件の対応をするとして12.5時間の削減に寄与。これがチームメンバー３０人×５地区で計算すると全部で1,875時間の削減に繋がります。通勤時間も加味すると一部署だけで年間約2,000時間の削減に貢献（さらに時間の無駄を省くだけでなく、それに掛かる人件費を約400万円もカットする出来ます）。


## DEMO
(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。
 - トップ画面：現在登録中の提案タイトルと完了フェーズが確認出来ます。
 - 提案内容登録画面：「NEW提案書」ボタンをクリックし、必要項目を入力します。
 - トップ画面に表示されている提案書はクリックすると詳細が確認出来ます。
 - 詳細画面：提案書作成者の場合は、提案内容の編集や削除が出来ます。
 - 詳細画面：決裁者に選択されている場合は、コメント入力と表示内容の確認、「確認済み」ボタンをクリック可能です。
 - 詳細画面：提案者でも決裁者でもない場合、コメントの表示はありません。


## 工夫したポイント
 - 


## 使用技術
 - Ruby on rails, Heroku, なんちゃってJavaScript, HTML/CSS


## 課題や今後実装したい機能
 - PDF化（登録した提案内容をPDF化し印刷すればそのまま決裁書として使用可能）
 - メール送信機能（確認を押すと次の決裁者にメールが送付され確認を促す）
 - セキュリティ面の充実（重要案件をアップロードするのでセキュリティは大切）
 - 検索機能（登録した提案書を検索する機能）


## DB設計
<img width="955" alt="スクリーンショット 2021-03-02 22 58 26" src="https://user-images.githubusercontent.com/72341088/109661952-dcdd9580-7bad-11eb-8c63-9148b93143dc.png">


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
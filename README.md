# アプリ名

フリマアプリ

# 概要

商品を出品したり削除編集することができます。また他人が出品した商品を購入することもできます。

# 本番環境

https://furima-31736-31736.herokuapp.com/
Herokuでデプロイしているため、Herokuの仕様により本番環境にアクセス頂いた際に画像リンクが切れている可能性がございます。

ID/Pass
ID: ruku
Pass: 726
テスト用アカウント等
購入者用
メールアドレス: a@k
パスワード: 0726Riku
購入用カード情報
番号：4242424242424242
期限：Wed Mar 24 2021 00:00:00 GMT+0900 (日本標準時)
セキュリティコード：123
出品者用
メールアドレス名: a@a
パスワード: 0726Riku

# 制作背景

プログラミングスクールでの最終課題成果物です。この課題でRuby on Rails / HTML / CSS の理解を深めました。

# 工夫した点

わからない問題に直面したときです。焦らずにまず一つずつ問題を分けるようにしました。自分がまず何から始めるべきか何がわからなくて何をわかっているかまた、何を聞けばいいか何を調べればいいかなどを整理して解決しました。

# 使用技術

Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code / Trello

# 課題や今後実装したい機能

スクールで習った技術の理解もまだまだ不十分なので、今後も常に学習を継続してさらに新しい技術も吸収し成長していきたいです。

# DB 設計


## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null:false              |
| email              | string              | null:false, unique: true|
| encrypted_password | string              | null:false              |
| last_name          | string              | null:false              |
| first_name         | string              | null:false              |
| last_name_kana     | string              | null:false              |
| first_name_kana    | string              | null:false              |
| birthday           | date                | null:false              |



### Association
has_many :items
has_many :purchases


## items table

| Column                              | Type        | Options                                |
|-------------------------------------|-------------|----------------------------------------|
| name                                | string      | null:false                             |
| explain                             | text        | null:false                             |
| category_id                         | integer     | null:false                             |
| sale_status_id                      | integer     | null:false                             |
| shipping_fee_status_id              | integer     | null:false                             |
| prefecture_id                       | integer     | null:false                             |
| scheduled_delivery_id               | integer     | null:false                             |
| price                               | integer     | null:false                             |
| user                                | references  | null:false, foreign_key: true          |




### Association
belongs_to :user
has_one :purchase

## purchases table

| Column         | Type         | Options                                        |
|----------------|--------------|------------------------------------------------|
| item           | references   | null: false, foreign_key: true                 |
| user           | references   | null: false, foreign_key: true                 |

### Association
belongs_to :user
belongs_to :item
has_one :address




## addresses table

| Column         | Type                  | Options                        |
|----------------|-----------------------|--------------------------------|
| postal_code    | string                | null:false                     |
| prefecture_id  | integer               | null:false                     |
| city           | string                | null:false                     |
| addresses      | string                | null:false                     |
| building       | string                |                                |
| phone_number   | string                | null:false                     |
| purchase       | references            | null: false, foreign_key: true |

### Association
belongs_to :purchase




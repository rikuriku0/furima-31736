# DB 設計


## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null:false              |
| email              | string              | null:false              |
| password           | string              | null:false              |
| last_name               | string              | null:false              |
| first_name               | string              | null:false              |
| last_name_kana               | string              | null:false              |
| first_name_kana               | string              | null:false              |
| birth              | date                | null:false              |



### Association
has_many :items
has_many :purchases
* 

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| img_upload                          | string     | null:false        |
| items                               | string     | null:false        |
| items_explain                       | text       | null:false        |
| item_category                       | string     | null:false        |
| item_sales-status                   | string     | null:false        |
| item_shipping-fee-status            | string     | null:false        |
| item_prefecture                     | string     | null:false        |
| item_scheduled-delivery             | integer    | null:false        |
| price                               | integer    | null:false        |
| add_tax_price                       | string     | null:false        |
| profit                              | integer    | null:false        |
| item_user                           | string     | null:false        |




### Association
belongs_to :user
- 

## purchases table

| Column         | Type         | Options                                        |
|----------------|--------------|------------------------------------------------|
| buy_item       | references   | null: false, foreign_key: true                 |
| buy_user       | references   | null: false, foreign_key: true                 |

### Association
has_many :users
has_one :addresses



## addresses table

| Column      | Type                  | Options                        |
|-------------|-----------------------|--------------------------------|
| postal_code | integer               | null:false                     |
| prefecture  | string                | null:false                     |
| city        | string                | null:false                     |
| addresses   | string                | null:false                     |
| building    | string                | null:false                     |
| phone_number| integer               | null:false                     |
| purchase    | references            | null: false, foreign_key: true |

### Association
has_one :purchases



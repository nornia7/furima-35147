# テーブル設計

## users テーブル

| Column          | Type    | Options    |
|-----------------|---------|------------|
| email           | string  | null:false |
| password        | string  | null:false |
| nickname        | string  | null:false |
| last_name       | string  | null:false |
| first_name      | string  | null:false |
| last_name_kana  | string  | null:false |
| first_name_kana | string  | null:false |
| birthday_year   | integer | null:false |
| birthday_month  | integer | null:false |
| birthday_date   | integer | null:false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options    |
|------------------|------------|------------|
| item_name        | string     | null:false |
| description      | text       | null:false |
| category         | string     | null:false |
| status           | string     | null:false |
| shipping_charges | integer    | null:false |
| shipping_area    | string     | null:false |
| shipping_date    | integer    | null:false |
| item_price       | integer    | null:false |
| user             | references |            |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column      | Type       | Options    |
|-------------|------------|------------|
| sold_status | integer    | null:false |
| user        | references |            |
| item        | references |            |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## Shippings テーブル

| Column         | Type       | Options    |
|----------------|------------|------------|
| zip_code       | integer    | null:false |
| prefectures    | string     | null:false |
| municipality   | string     | null:false |
| street_address | string     | null:false |
| building_name  | string     |            |
| phone_number   | integer    | null:false |
| order          | references |            |


### Association

- belongs_to :order

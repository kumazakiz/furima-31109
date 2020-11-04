# DB設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| title         | string  | null: false |
| explanation   | text    | null: false |
| category      | string  | null: false |
| item_status   | integer | null: false |
| shipping_cost | integer | null: false |
| shipping_area | integer | null: false |
| days_to_ship  | integer | null: false |
| selling_price | integer | null: false |
| user          | string  | null: false |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :buyer


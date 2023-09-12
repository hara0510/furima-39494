## usersテーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| nickname           | string  | null: false                    |
| email              | string  | null: false, unique: true      |
| encrypted_password | string  | null: false                    |
| last_name          | string  | null: false                    |
| first_name         | string  | null: false                    |
| last_name_kana     | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| birthday           | date    | null: false                    |
| address_id         | integer | null: false, foreign_key: true |

### Association
has_many :items
has_one :address
has_many :orders



## itemsテーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| item_name    | string  | null: false                    |
| description  | text    | null: false                    |
| category     | string  | null: false                    |
| condition    | string  | null: false                    |
| shipping_fee | integer | null: false                    |
| area         | string  | null: false                    |
| deliverydays | integer | null: false                    |
| price        | integer | null: false                    |
| user_id      | integer | null: false, foreign_key: true |

### Association
belongs_to :user
has_many :orders



## addressesテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| postal_code | string  | null: false |
| prefecture  | string  | null: false |
| city        | string  | null: false |
| address     | string  | null: false |
| building    | string  |             |
| tel         | string  | null: false |
| user_id     | integer | null: false |

### Association
belongs_to :user



## ordersテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item

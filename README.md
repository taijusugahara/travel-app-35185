# テーブル設計

## user テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| email                 | string | null: false, uniqueness: true |
| encrypted_password    | string | null: false                   |
| first_name            | string | null: false                   |
| last_name             | string | null: false                   |
| first_name_kana       | string | null: false                   |
| last_name_kana        | string | null: false                   |
| birthday              | date   | null: false                   |

### Association

- has_many :country_users
- has_many :countries, through: country_users
- has_many :plane_users
- has_many :planes, through: plane_users
- has_many :hotel_users
- has_many :hotels, through: hotel_users
- has_many :orders

## country_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| country| references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :country

## plane_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| plane  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :plane

## country_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| hotel  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :hotel

## country テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |

### Association

- has_many :country_users
- has_many :users, through: country_users
- has_many :planes
- has_many :hotels
- has_many :orders

## plane テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| price                 | integer| null: false                   |
| go_date               | date   | null: false                   |
| back_date             | date   | null: false                   |
| country               | references | null: false, foreign_key: true |

### Association

- has_many :plane_users
- has_many :users, through: plane_users
- belongs_to :country
- has_many :plane_hotels
- has_many :hotels, through: plane_hotels
- has_many :orders

## plane_hotels テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| plane  | references | null: false, foreign_key: true |
| hotel  | references | null: false, foreign_key: true |

### Association

- belongs_to :plane
- belongs_to :hotel

##  hotel テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| price                 | integer| null: false                   |
| day                   | integer| null: false                   |
| total_price           | integer| null: false                   |
| country               | references | null: false, foreign_key: true |

### Association

- has_many :hotel_users
- has_many :users, through: hotel_users
- belongs_to :country
- has_many :plane_hotels
- has_many :planes, through: plane_hotels
- has_many :orders

## order テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| country| references | null: false, foreign_key: true |
| plane  | references | null: false, foreign_key: true |
| hotel  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :country
- belongs_to :plane
- belongs_to :hotel
- has_one :info

##  info テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| passport_number       | integer| null: false                   |
| start_date            | date   | null: false                   |
| end_date              | date   | null: false                   |

### Association

- belongs_to: order
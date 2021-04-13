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

- has_many :countries
- has_many :planes
- has_many :hotels
- has_many :orders


## country テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| user               | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :plane
<!-- - has_many :hotels -->
- has_one :order

## plane テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| price                 | integer| null: false                   |
| go_date               | date   | null: false                   |
| back_date             | date   | null: false                   |
| user                  | references | null: false, foreign_key: true |
| country               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :country
- has_one :hotel
- has_one :order

##  hotel テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| price                 | integer| null: false                   |
| day                   | integer| null: false                   |
| total_price           | integer| null: false                   |
| plane                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :plane
- has_one :order

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
# アプリケーション名
<div><strong>Travel app</strong></div>

# アプリケーション概要
<div>当アプリケーションは東南アジア向け簡易旅行アプリです。行きたい国を選択した後、飛行機(往復)、飛行機(行き)、飛行機(帰り)、ホテル、ツアーの中からお好きな組み合わせでサービスを購入することが可能です。</div>
<div>それぞれの予約ページに行き、必要な情報を入力してください。その後購入ページにてカード情報とパスポートを入力していただければ購入完了です。料金はpay.jpへと支払われ、また購入した内容がgmailでユーザー登録時に入力したemailへと送られます。</div>
<div>またトップページには国診断テストを設けており、国選びでお悩みの方などはこちらの診断テストにて全5問お好きな画像を選択するだけで、おすすめの国が表示されます。</div>

# URL
https://travel-app-35185.herokuapp.com/

# 制作背景
<div>旅行が好きなので旅行にまつわるアプリケーションを作ろうと思いました。旅行する上でわざわざ飛行機・ホテルを別々に購入するのは手間だと感じたため、一括で購入できるように作成致しました。</div>
<div>また国選びでお悩みの際にどの国が自分に合っているのか分かると利用者にとっても使いやすいと感じ、国診断テストをアプリケーション内に入れました。</div>

# 実装した機能

まずトップページには国を選択するリンクと国診断テストのリンクがあります。
国診断テストではお好きな画像を選ぶ問題が5問出題され、選択結果によっておすすめの国が表示されます。
[![Image from Gyazo](https://i.gyazo.com/f340e1d1959a19d32242a3f24d2f87c3.gif)](https://gyazo.com/f340e1d1959a19d32242a3f24d2f87c3)

国を選択した後はこのアプリケーションのメインページに行きます。このページから飛行機(往復)、飛行機(行き)、飛行機(帰り)、ホテル、ツアーそれぞれ予約するページに行くリンクがあります。また購入ページに行くリンクもあります。国を変更したくなった方や取り消したくなった方はトップページに戻るリンクをクリックすると選択した国の情報が削除されます。
[![Image from Gyazo](https://i.gyazo.com/4be84cf55bb9a3e1c650eb3e6bb947a4.gif)](https://gyazo.com/4be84cf55bb9a3e1c650eb3e6bb947a4)

<div><strong>予約機能</strong></div>
<div>ここでは例として飛行機(往復)をあげます。メインページから飛行機(往復)を選ぶをクリックすると飛行機(往復)の情報が表示され、予約ページへのリンクがあります。飛行機の情報は国ごとに変わります。
予約ページ内で行きたい飛行機の情報を入力すれば、先程のメインページに戻り、入力した情報が表示されお支払い金額に加算されます。</div>

[![Image from Gyazo](https://i.gyazo.com/8841d5c22ea906f3a41da6211842eae0.gif)](https://gyazo.com/8841d5c22ea906f3a41da6211842eae0)
<div>その時先程まであった飛行機(往復)を選ぶリンクはなく、代わりに変更・取り消しのリンクが存在し変更または取り消すことが可能です。</div>

[![Image from Gyazo](https://i.gyazo.com/f2623cb94aecf1c13930385042ab0ee1.gif)](https://gyazo.com/f2623cb94aecf1c13930385042ab0ee1)

<div>他のサービスも入力内容は多少違いますが、同様に予約・変更・取り消し出来ます。</div>
<div>またホテルに関してはGoogle mapを利用して地図を表示しております。それぞれのマーカーをクリックするとホテル名が表示されます。</div>

[![Image from Gyazo](https://i.gyazo.com/c41cfb9d600593a06dd4681704b1f60c.gif)](https://gyazo.com/c41cfb9d600593a06dd4681704b1f60c)


<div><strong>購入機能</strong></div>
<div>それぞれお好きなサービスを組み合わせ自由で購入いただけます。</div>
<div>ただしメインページの注意事項に書かれている組み合わせは購入できません。</div>
<div>購入ページではカード情報とパスポート情報を入力してください。パスポート番号は英語大文字と数字の組み合わせでご記入ください。</div>
<div>購入が完了しましたらpay.jpへと料金が支払われ、購入内容の確認メールがGmailでユーザー登録時に入力したemailへと送られます。</div>

[![Image from Gyazo](https://i.gyazo.com/018aefdd6c0313401b632130ebe9b18b.gif)](https://gyazo.com/018aefdd6c0313401b632130ebe9b18b)













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
- has_many :plane_gos
- has_many :plane_backs
- has_many :hotels
- has_many :tours
- has_many :orders


## country テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| user               | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :plane
- has_one :plane_go
- has_one :plane_back
- has_one :hotel
- has_one :plane_tour
- has_one :order

## plane テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| price                 | integer| null: false                   |
| howmany               | integer| null: false                   |
| go_date               | date   | null: false                   |
| back_date             | date   | null: false                   |
| go_time               | string | null: false                   |
| back_time             | string | null: false                   |
| user                  | references | null: false, foreign_key: true |
| country               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :country

## plane_go テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| price                 | integer| null: false                   |
| howmany               | integer| null: false                   |
| go_date               | date   | null: false                   |
| go_time               | string | null: false                   |
| user                  | references | null: false, foreign_key: true |
| country               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :country

## plane_back テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| price                 | integer| null: false                   |
| howmany               | integer| null: false                   |
| back_date             | date   | null: false                   |
| back_time             | string | null: false                   |
| user                  | references | null: false, foreign_key: true |
| country               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :country


##  hotel テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| price                 | integer| null: false                   |
| howmany               | integer| null: false                   |
| day                   | integer| null: false                   |
| go_date               | date   | null: false                   |
| back_date             | date   | null: false                   |
| user                  | references | null: false, foreign_key: true |
| country               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :country

##  tour テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| name                  | string | null: false                   |
| price                 | integer| null: false                   |
| span                  | integer| null: false                   |
| howmany               | integer| null: false                   |
| go_date               | date   | null: false                   |
| user                  | references | null: false, foreign_key: true |
| country               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :country



## order テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| country   | references | null: false, foreign_key: true |
| plane     | references |                                |
| plane_go  | references |                                |
| plane_back| references |                                |
| hotel     | references |                                |
| tour      | references |                                |

### Association

- belongs_to :user
- belongs_to :country
- has_one :info

##  info テーブル

| Column                | Type   | Options                       |
| ----------------------| ------ | ----------------------------- |
| first_name            | string | null: false                   |
| last_name             | string | null: false                   |
| passport_number       | integer| null: false                   |
| order             | references | null: false, foreign_key: true |


### Association

- belongs_to: order

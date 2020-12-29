# README

##users テーブル

| Column            | Type   | Options                   |
| ----------------- | -------| ------------------------- |
| nikuname          | string | null: false               | <!-- ニックネーム -->　
| email             | string | null: false, uniaue:turue | <!-- メール-->
| encrpted_password | string | null: false               | <!-- パスワード -->
| fast_name         | string | null: false               | <!-- 名字 -->
| last_name         | string | null: false               | <!-- 名前 -->
| fast_name_kana    | string | null: false               | <!-- 名字カナ -->
| last_name_kana    | string | null: false               | <!-- 名前カナ --> 
| barth_day         | date   | null: false               | <!-- 誕生日 -->

### Association
-has_many:oreders
-has_many:items


##items テーブル

| Column               | type    | Options                      |
| -------------------  | ------- | ---------------------------- |
| product_name         | string  | null: false                  | <!-- 商品名 -->
| product_explanation  | text    | null: false                  | <!-- 商品説明 -->
| category_id          | integer | null: false                  | <!-- カテゴリー -->
| product_state_id     | integer | null: false                  | <!-- 商品状態 -->
| delivery_id          | integer | null: false                  | <!-- 配送料 -->
| distribution_area_id | integer | null: false                  | <!-- 配送地域 -->
| shipping_number_id   | integer | null: false                  | <!-- 配送日数 -->
| price                | integer | null: false, foreign_key:ture| <!-- 価格 -->

### Association
-has_many:oreders
-has_many:items


##ordersテーブル

| Column        | type       | Options     |
| ------------- | ---------- | ----------- |
| item          | string     | null: false | 
| user          | string     | null: false | 

### Association
-belongs_to:user
-belongs_to:item
-has_one:street_address

##street_addressテーブル

| Column        | type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false | <!-- 郵便番号 -->
| prefecture_id | string     | null: false | <!-- 都道府県 -->
| city          | string     | null: false | <!-- 市町村 -->
| block         | string     | null: false | <!-- 番地 -->
| building      | string     |             | <!-- 建物 -->
| phone_number  | string     | null: false | <!-- 電話番号 -->
| order         | string     | null: false | <!-- 注文 -->

### Association
-belongs_to:order
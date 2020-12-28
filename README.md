# README

##users テーブル

| Column          | Type   | Options     |
| --------------- | -------| ----------- |
| nikuname        | string | null: false | <!-- ニックネーム -->　
| email           | string | null: false | <!-- メール-->
| password        | string | null: false | <!-- パスワード -->
| fast_name       | string | null: false | <!-- 名字 -->
| last_name       | string | null: false | <!-- 名前 -->
| fast_name_kana  | string | null: false | <!-- 名字カナ -->
| last_name_kana  | string | null: false | <!-- 名前カナ --> 
| barth_day       | string | null: false | <!-- 誕生日 -->

### Association


##items テーブル

| Column              | type   | Options     |
| ------------------- | -------| ----------- |
| product_name        | string | null: false | <!-- 商品名 -->
| product_explanation | string | null: false | <!-- 商品説明 -->
| category            | string | null: false | <!-- カテゴリー -->
| product_state       | string | null: false | <!-- 商品状態 -->
| delivery            | string | null: false | <!-- 配送料 -->
| distribution_area   | string | null: false | <!-- 配送地域 -->
| shipping_number     | string | null: false | <!-- 配送日数 -->
| price               | string | null: false | <!-- 価格 -->

### Association


##street_addressテーブル

| Column        | type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false | <!-- 郵便番号 -->
| prefecture_id | string     | null: false | <!-- 都道府県 -->
| city          | string     | null: false | <!-- 市町村 -->
| block         | string     | null: false | <!-- 番地 -->
| building      | string     | null: false | <!-- 建物 -->
| phone_number  | string     | null: false | <!-- 電話番号 -->
| order         | string     | null: false | <!-- 注文 -->

### Association

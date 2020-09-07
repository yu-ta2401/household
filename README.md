## アプリケーション名： household
## 概要： householdでは、生活家電について検索出来ます。
## URL: 
## テスト用アカウント: 
## 利用方法: 検索バーからメーカー、カテゴリを選択すると、商品一覧ページに飛び、商品をクリックすると詳細が見れます。
## 目指した課題解決: 日頃時間ない主婦や時間をかけたくない人に簡単に家電が調べる事ができないか、調べたい家電を詳しい情報を載せる事が出来ないかと思い課題解決に取り組みました。
## 洗い出した要件:
|   機能   |   目的   |    詳細   |   ストーリー  |
|---------|---------|-----------|------------|
|  商品検索 | ユーザーが簡単に商品を検索する | 複数の検索条件で調べたい商品を検索する | ・商品名/サイズ/商品状態/値段などの検索条件を指定する欄を設ける・条件に該当する商品の検索結果のページで表示する |
| コメント機能 | 他のユーザーのコメントが見れる | コメントでメリットやでメリットが見れる | ・コメントで使用状態や使い勝手が分かる・5段階評価を設けて見やすくする |
| 商品カタログ | 商品の詳細が分かる | メーカのカタログを載せることに商品紹介が分かりやすくなる | ・カタログの写真を載せるもしくはpdFファイルを貼る |

## 実装した機能についてのGIFと説明:
## 実装予定の機能: ユーザーのコメント機能やメーカーのカタログ
## データベース設計: https://gyazo.com/9bc7b3b1ecc722122e5fdcbbd96c19f4
## ローカルでの動作方法:



# テーブル設計

## users テーブル

| Colnmu      | Type   | Options     |
| ----------- |------- | ----------- |
| nickname    | string | nul]: false |
| firstname   | string | null: false |
| lastname    | string | null: false |
| firstname_kana   | string | null: false |
| lastname_kana    | string | null: false |
| birthday       | date | null: false |
| email       | string | null: false |
| password    | string | null: false |

### Association
- has_many :items
- has_many :items, through: user_items
- has_many :comment

## items テーブル

| Colnmu      | Type    | Options     |
| ----------- |-------  | ----------- |
| image       | text    | null: false |
| name        | string  | null: false |
| category_id | integer | null: false |
| price       | integer | null: false |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :users, through: user_items
- has_one :comment

## user_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


## comments テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| content | string  |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

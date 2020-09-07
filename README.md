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
| width        | string  | null: false |
| depth        | string  | null: false |
| height        | string  | null: false |
| explanation | text | null: false |
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
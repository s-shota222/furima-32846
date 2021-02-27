## usersテーブル
| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| first_name      | string   | null: false |
| last_name       | string   | null: false |
| first_name_ruby | string   | null: false |
| last_name_ruby  | string   | null: false |
| birthday        | date     | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| information   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery_fee  | integer    | null: false                    |
| shipping_area | string     | null: false                    |
| days_to_ship  | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase

## purchasesテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addressesテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| adress        | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

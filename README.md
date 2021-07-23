## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| name               | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth              | string | null: false |

## goods テーブル
| Column             | Type      | Options                         |
| ------------------ | --------- | --------------------------------|
| goods_name         | string    | null: false                     |
| text               | text      | null: false                     | 
| category           | string    | null: false                     |  
| condition          | string    | null: false                     |
| shipping           | string    | null: false                     | 
| ship_from          | string    | null: false                     | 
| shipment_date      | string    | null: false                     |  
| user               | references| null: false, foreign_key: true  |

## orders テーブル
| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| user               | references | null: false, foreign_key: true  |
| goods              | references | null: false, foreign_key: true  |

## addresses　テーブル
| Column             | Type      | Options                         |
| ------------------ | --------- | --------------------------------|
| postal_code        | string    | null: false                     |
| state              | text      | null: false                     | 
| city               | string    | null: false                     |  
| address_line       | string    | null: false                     |
| phone              | string    | null: false                     | 
| user               | references| null: false, foreign_key: true  |
| goods              | references| null: false, foreign_key: true  |
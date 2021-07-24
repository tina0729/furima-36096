## users テーブル
| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| nickname           | string | null: false             |
| email              | string | null: false,unique: true|
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| last_name          | string | null: false             |
| first_name_kana    | string | null: false             |
| last_name_kana     | string | null: false             |
| birth              | date   | null: false             |

### Association

* has_many :products
* has_many :orders

## products テーブル
| Column             | Type      | Options                         |
| ------------------ | --------- | --------------------------------|
| product_name       | string    | null: false                     |
| information        | text      | null: false                     | 
| price              | integer   | null: false                     |
| category_id        | integer   | null: false                     |  
| condition_id       | integer   | null: false                     |
| shipping_id        | integer   | null: false                     | 
| ship_from_id       | integer   | null: false                     | 
| shipment_date_id   | integer   | null: false                     |  
| user               | references| null: false, foreign_key: true  |

### Association

* belongs_to :user
* has_one :order

## orders テーブル
| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| user               | references | null: false, foreign_key: true  |
| product            | references | null: false, foreign_key: true  |
| address            | references | null: false, foreign_key: true  |

### Association

* has_many :users
* belongs_to :products
* has_one :address

## addresses テーブル
| Column             | Type      | Options                         |
| ------------------ | --------- | --------------------------------|
| postal_code        | string    | null: false                     |
| prefecture_id      | integer   | null: false                     | 
| city               | integer   | null: false                     |  
| address_line       | integer   | null: false                     |
| building_name      | string    |                                 |
| phone              | string    | null: false                     | 
| user               | references| null: false, foreign_key: true  |
| order              | references| null: false, foreign_key: true  |

### Association

* belongs_to :product
* belongs_to :order
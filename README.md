## users テーブル
| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| nickname           | string | null: false             |
| email              | string | null: false,unique: true|
| name               | string | null: false             |
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
| category_id        | integer   | null: false                     |  
| condition_id       | integer   | null: false                     |
| shipping_id        | integer   | null: false                     | 
| ship_from_id       | integer   | null: false                     | 
| shipment_date_id   | integer   | null: false                     |  
| user               | references| null: false, foreign_key: true  |

### Association

* belongs_to :users
* has_one :orders
* has_one :addresses

## orders テーブル
| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| user               | references | null: false, foreign_key: true  |
| product            | references | null: false, foreign_key: true  |

### Association

* has_many :users
* belongs_to :products

## addresses テーブル
| Column             | Type      | Options                         |
| ------------------ | --------- | --------------------------------|
| postal_code_id     | integer   | null: false                     |
| state_id           | integer   | null: false                     | 
| city_id            | integer   | null: false                     |  
| address_line_id    | integer   | null: false                     |
| building_name      | string    | null: false                     |
| phone              | string    | null: false                     | 
| user               | references| null: false, foreign_key: true  |
| order              | references| null: false, foreign_key: true  |

### Association

* belongs_to :products
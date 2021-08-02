class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :product_name,        null: false
      t.text    :information,         null: false
      t.integer :price,               null: false
      t.integer :category_id,         null: false
      t.integer :condition_id,        null: false
      t.integer :shipping_id,         null: false
      t.integer :prefecture_id,       null: false
      t.integer :shipment_date_id,    null: false
      t.references :user,             foreign_key: true
      t.timestamps
    end
  end
end

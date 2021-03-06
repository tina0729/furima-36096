class Product < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipment_date
  belongs_to :shipping

  with_options presence: true do
    validates :product_name, :information, :image
    validates :category_id, :condition_id, :shipping_id, :prefecture_id, :shipment_date_id,
              numericality: { other_than: 1, message: 'is invalid' }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end

class Product < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :prefecture, :shipment_date, :shipping
  validates :product_name, :information, :price, presence: true
  validates :category_id, :condition_id, :shipping_id, :prefecture_id, :shipment_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end

class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building_name, :phone, :user_id, :product_id, :token

  with_options presence: true do
    validates :city, :address_line, :token, :user_id, :product_id
    validates :prefecture_id, numericality: { other_than: 1, message: 'is invalid' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone, length: { in: 10..11 }, format: { with: /\A[0-9]+\z/ }
  end

  def save
    order = Order.create(product_id: product_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line,
                   building_name: building_name, phone: phone, order_id: order.id)
  end
end

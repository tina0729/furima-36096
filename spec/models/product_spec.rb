require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'product_name、information、price、category_id、condition_id、shipping_id、prefecture_id、shipment_date_idとimageが存在すれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '出品できないとき' do
      it 'product_nameが空だと出品できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'informationが空だと出品できない' do
        @product.information = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Information can't be blank")
      end

      it 'priceが空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'category_idが空だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空だと出品できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_idが空だと出品できない' do
        @product.shipping_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping can't be blank")
      end

      it 'prefecture_idが空だと出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipment_date_idが空だと出品できない' do
        @product.shipment_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipment date can't be blank")
      end

      it 'priceが¥300以下だと出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが¥9999999以上だと出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceは半角数字でないと出品できない' do
        @product.price = '１２３４５'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end

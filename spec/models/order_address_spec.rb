require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '購入できるとき' do
      it 'postal_code、prefecture_id、city、address_line、phone、token、が存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できないとき' do
      it "tokenが空だと登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが空だと登録できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

        it 'address_lineが空だと登録できない' do
          @order_address.address_line = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address line can't be blank")
        end

        it 'phoneが空だと登録できない' do
          @order_address.phone = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone can't be blank")
        end

        it 'phoneは10桁以上でないと登録できない' do
          @order_address.phone = '123456789'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone is too short (minimum is 10 characters)")
        end

        it 'phoneは11桁以内でないと登録できない' do
          @order_address.phone = '1234567891011'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
        end

        it 'phoneは半角数値のみでないと登録できない' do
          @order_address.phone = '１２３-４５６６７８'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone is invalid")
        end

        it 'userが紐付いていないと購入できないこと' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end  

        it 'productが紐付いていないと購入できないこと' do
          @order_address.product_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Product can't be blank")
        end  
    end
  end      

end

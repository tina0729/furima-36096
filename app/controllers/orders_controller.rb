class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if current_user == @product.user
      redirect_to root_path
    end  
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_product
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    if current_user == @product.user || @product.order != nil
      redirect_to root_path
    end  
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building_name, :phone).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

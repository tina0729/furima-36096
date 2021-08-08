class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @product = Product.find(params[:product_id])
  end
  
  def create
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end    
  end
  
  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building_name, :phone).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end

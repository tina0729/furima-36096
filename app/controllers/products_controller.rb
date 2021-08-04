class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #def index
    #@products = Product.all
  #end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private


  def product_params
    params.require(:product).permit(:product_name, :information, :price, :category_id, :condition_id, :shipping_id,
                                    :prefecture_id, :shipment_date_id, :image).merge(user_id: current_user.id)
  end
end

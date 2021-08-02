class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end  

  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end  

  def product_params
    params.require(:product).permit(:image).merge(user_id: current_user.id)
end

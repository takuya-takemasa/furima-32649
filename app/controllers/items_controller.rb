class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index 
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
   end

  private
  def items_params
    params.require(:item).permit(:product_name, :product_explanation, :category_id, :product_state_id, :delivery_id, :prefecture_id, :shipping_number_id, :price, :image).merge(user_id: current_user.id)
  end

end
#  binding.pry
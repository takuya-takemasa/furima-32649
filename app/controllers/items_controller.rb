class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index 
    @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user.id
  end
  
  
  
  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  def items_params
    params.require(:item).permit(:product_name, :product_explanation, :category_id, :product_state_id, :delivery_id, :prefecture_id, :shipping_number_id, :price, :image).merge(user_id: current_user.id)
  end



end

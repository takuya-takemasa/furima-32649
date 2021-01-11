class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:edit, :show, :update, :destroy]

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
    
  end

  def edit
    
  end
  
  def update
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
   if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  
  private
  
  def items_params
    params.require(:item).permit(:product_name, :product_explanation, :category_id, :product_state_id, :delivery_id, :prefecture_id, :shipping_number_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end

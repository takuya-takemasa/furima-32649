class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :detect_item, only: [:index, :create]
  def index
    
    @order_furima = OrderFurima.new 
    redirect_to root_path if @item.order.present? || @item.user_id == current_user.id
  end

  def create
    
    @order_furima = OrderFurima.new(order_furima_params)
    if @order_furima.valid?
      pay_item
      @order_furima.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def detect_item        #商品特定
    @item = Item.find(params[:item_id])
  end
  
  def order_furima_params
    params.require(:order_furima).permit(:postal_code, :product_state_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_furima_params[:token],
      currency: 'jpy'
    )
  end
end

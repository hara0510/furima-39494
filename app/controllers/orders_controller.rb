class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if current_user.id == @item.user_id
          redirect_to root_path
      elsif @item.orders.any?
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

end

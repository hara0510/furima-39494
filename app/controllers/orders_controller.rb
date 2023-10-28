class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :set_item_find, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if current_user.id == @item.user_id
        redirect_to root_path
      elsif @item.order.present?
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item_find
    @item = Item.find(params[:item_id])
  end
end

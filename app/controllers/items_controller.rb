class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if @item.orders.any?
      redirect_to items_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless user_signed_in? && current_user.id == @item.user_id

    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shippingfee_id, :prefecture_id,
                                 :deliveryday_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item_find
    @item = Item.find(params[:id])
  end

  def move_to_index
    if user_signed_in?
      redirect_to root_path unless current_user.id == @item.user_id
    else
      redirect_to new_user_session_path
    end
  end
end

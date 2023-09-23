class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shippingfee_id, :prefecture_id, :deliveryday_id, :price, :image).merge(user_id: current_user.id)
  end
end
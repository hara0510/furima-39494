class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tel, :order_id

  with_options presence: true do
    validates :user_id, presence:true
    validates :item_id, presence:true

    validates :postal_code, presence: true
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, presence: true
    validates :address, presence: true
    validates :tel, presence:true
    validates :order_id, presence:true
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, order_id: order_id)
  end
end
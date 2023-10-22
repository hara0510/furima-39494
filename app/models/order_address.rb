class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tel, :order_id

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/,message:"is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel,
      format: {
        with: /\A[0-9]+\z/,
        message: "is invalid. Input only number"
      }, 
      length: {
       minimum: 10, too_short: "is too short",
       maximum: 11, too_long: "is too long"
      }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
  end
end
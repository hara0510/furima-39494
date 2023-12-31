class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tel, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel,
              format: {
                with: /\A[0-9]+\z/,
                message: 'is invalid. Input only number'
              },
              length: {
                minimum: 10, too_short: 'is too short',
                maximum: 11, too_long: 'is too long'
              }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(postal_code:, prefecture_id:, city:, address:, building:,
                   tel:, order_id: order.id)
  end
end

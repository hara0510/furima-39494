class DonationAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tel, :order_id

  with_options presence: true do
    validates :user, presence:true
    validates :item, presence:true

    validates :postal_code, presence: true
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, presence: true
    validates :address, presence: true
    validates :tel, presence:true
    validates :order, presence:true
  end
end
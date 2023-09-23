class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shippingfee
  belongs_to :prefecture
  belongs_to :deliveryday

  validates :item_name, :description, presence: true
  validates :category_id, :condition_id, :shippingfee_id, :prefecture_id, :deliveryday_id, numericality: { other_than: 1 }
  validates :price, :presence :true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_ewual_to: 9_999_999 }
end
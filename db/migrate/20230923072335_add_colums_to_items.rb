class AddColumsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :item_name, :string, null: false
    add_column :items, :description, :text, null: false
    add_column :items, :category_id, :integer, null: false
    add_column :items, :condition_id, :integer, null: false
    add_column :items, :shippingfee_id, :integer, null: false
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :deliveryday_id, :integer, null: false
    add_column :items, :price, :integer, null: false
    add_reference :items, :user, null: false, foreign_key: true
  end
end



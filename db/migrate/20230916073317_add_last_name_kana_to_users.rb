class AddLastNameKanaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_name_kana, :string, null: false
  end
end

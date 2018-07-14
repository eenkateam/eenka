class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_kana, :string
    add_column :users, :last_kana, :string
    add_column :users, :postal_code, :string
    add_column :users, :adress, :string
    add_column :users, :flag, :integer
  end
end

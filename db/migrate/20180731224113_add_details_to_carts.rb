class AddDetailsToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :receiver_id, :integer
  end
end

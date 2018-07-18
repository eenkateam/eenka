class RemoveOrederIdFromCartProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_products, :oreder_id, :integer
  end
end

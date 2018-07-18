class RemovePriceFromCartProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_products, :price, :integer
  end
end

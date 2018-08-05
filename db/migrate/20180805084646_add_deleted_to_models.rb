class AddDeletedToModels < ActiveRecord::Migration[5.2]
  def change
  	add_column :discs, :deleted_at, :datetime
  	add_column :cart_products, :deleted_at, :datetime
  	add_column :order_products, :deleted_at, :datetime
  end
end

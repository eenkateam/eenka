class RemoveFlagFromProducts < ActiveRecord::Migration[5.2]
  def change
  	remove_column :products, :flag
  end
end

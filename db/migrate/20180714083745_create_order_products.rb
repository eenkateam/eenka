class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :price
      t.integer :count

      t.timestamps
    end
  end
end

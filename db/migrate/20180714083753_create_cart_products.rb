class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :product_id
      t.integer :oreder_id
      t.integer :price
      t.integer :count

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :product_name
      t.integer :artist_id
      t.integer :price
      t.integer :label_id
      t.integer :genre_id
      t.string :image_id
      t.integer :stock

      t.timestamps
    end
  end
end

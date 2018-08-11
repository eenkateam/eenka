class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :disc_name
      t.integer :product_id
      t.integer :disc_number

      t.timestamps
    end
  end
end

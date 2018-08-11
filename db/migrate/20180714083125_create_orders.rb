class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.integer :carry_status
      t.string :first_name
      t.string :last_name
      t.string :first_kana
      t.string :last_kana
      t.string :postal_code
      t.string :adress

      t.timestamps
    end
  end
end

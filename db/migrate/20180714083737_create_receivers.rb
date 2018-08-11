class CreateReceivers < ActiveRecord::Migration[5.2]
  def change
    create_table :receivers, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :receiver_name
      t.string :receiver_adress

      t.timestamps
    end
  end
end

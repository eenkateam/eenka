class AddDetailsToReceivers < ActiveRecord::Migration[5.2]
  def change
    add_column :receivers, :user_id, :integer
  end
end

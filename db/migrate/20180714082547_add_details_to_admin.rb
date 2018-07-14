class AddDetailsToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :admin_name, :string
  end
end

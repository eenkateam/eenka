class AddDetailsToLabel < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :opinion, :text
  end
end

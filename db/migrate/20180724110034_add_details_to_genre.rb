class AddDetailsToGenre < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :opinion, :text
  end
end

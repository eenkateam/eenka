class AddDetailsToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :opinion, :text
    add_column :artists, :artist_image_id, :string
  end
end

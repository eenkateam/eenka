class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :song_name
      t.integer :disc_id
      t.integer :song_number

      t.timestamps
    end
  end
end

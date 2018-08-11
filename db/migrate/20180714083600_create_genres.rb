class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :genre_name

      t.timestamps
    end
  end
end

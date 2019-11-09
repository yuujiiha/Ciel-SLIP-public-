class CreateAlbumSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :album_songs do |t|
      t.references :song, foreign_key: true
      t.references :album, foreign_key: true
      t.integer :order, null: false

      t.timestamps
    end
  end
end

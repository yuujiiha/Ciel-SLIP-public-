class RenameOrderColumnToAlbumSong < ActiveRecord::Migration[5.2]
  def change
    rename_column :album_songs, :order, :number
  end
end

class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.date :release
      t.string :lyricist
      t.string :composer

      t.timestamps
    end
  end
end

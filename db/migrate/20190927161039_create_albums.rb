class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.date :release
      t.boolean :single

      t.timestamps
    end
  end
end

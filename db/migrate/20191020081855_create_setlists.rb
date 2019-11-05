class CreateSetlists < ActiveRecord::Migration[5.2]
  def change
    create_table :setlists do |t|
      t.references :concert, foreign_key: true
      t.references :song, foreign_key: true
      t.date :date
      t.integer :number

      t.timestamps
    end
  end
end

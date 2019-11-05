class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.string :title
      t.string :place

      t.timestamps
    end
  end
end

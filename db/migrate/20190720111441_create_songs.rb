class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disk_id, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end

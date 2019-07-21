class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :artist_id
      t.integer :genle_id
      t.integer :label_id
      t.string :title, null: false
      t.integer :price, null: false
      t.boolean :status, null: false, default: false
      t.integer :stock, null: false
      t.string :jacket_image_id

      t.timestamps
    end
  end
end

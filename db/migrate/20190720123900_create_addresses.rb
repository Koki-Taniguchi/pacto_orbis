class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end

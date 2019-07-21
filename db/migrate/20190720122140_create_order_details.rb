class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :cd_amount, null: false
      t.integer :cd_price, null: false

      t.timestamps
    end
  end
end

class CreatePotions < ActiveRecord::Migration[6.0]
  def change
    create_table :potions do |t|
      t.string :name
      t.integer :heal_amount
      t.integer :cost
      t.string :image_url
      t.integer :inventory_id
      t.integer :merchant_id

      t.timestamps
    end
  end
end

class CreatePotions < ActiveRecord::Migration[6.0]
  def change
    create_table :potions do |t|
      t.string :name
      t.integer :heal_amount
      t.string :image_url


      t.timestamps
    end
  end
end

class CreateWeapons < ActiveRecord::Migration[6.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :damage
      t.integer :cost
      t.string :image_url
      t.integer :inventory_id
      t.integer :merchant_id

      t.timestamps
    end
  end
end

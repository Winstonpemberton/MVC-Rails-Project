class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :saying
      t.string :image_url
      t.integer :inventory_id
      t.integer :weapon_id
      t.integer :armor_id
      t.integer :potion_id

      t.timestamps
    end
  end
end

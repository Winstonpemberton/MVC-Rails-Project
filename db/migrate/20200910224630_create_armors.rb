class CreateArmors < ActiveRecord::Migration[6.0]
  def change
    create_table :armors do |t|
      t.string :name
      t.integer :armor_raiting
      t.string :image_url

      t.timestamps
    end
  end
end

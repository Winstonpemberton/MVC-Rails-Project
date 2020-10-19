class CreateEnemies < ActiveRecord::Migration[6.0]
  def change
    create_table :enemies do |t|
      t.string :name
      t.integer :damage
      t.integer :health
      t.string :image_url
      t.integer :game_id
      t.integer :character_id

      t.timestamps
    end
  end
end

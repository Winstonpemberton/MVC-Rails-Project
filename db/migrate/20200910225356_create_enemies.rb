class CreateEnemies < ActiveRecord::Migration[6.0]
  def change
    create_table :enemies do |t|
      t.string :name
      t.integer :damage
      t.integer :health
      t.string :image_url

      t.timestamps
    end
  end
end
rails g migration add_game_id_to_enemies --no-test-framework
class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :wave_amount
      t.integer :enemy_amount
      t.integer :user_id
      t.integer :character_id

      t.timestamps
    end
  end
end

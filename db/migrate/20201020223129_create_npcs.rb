class CreateNpcs < ActiveRecord::Migration[6.0]
  def change
    create_table :npcs do |t|
      t.string :name
      t.string :saying
      t.integer :user_id
      t.integer :game_id
      
      t.timestamps
    end
  end
end

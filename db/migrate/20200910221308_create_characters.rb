class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :gold
      t.integer :health
      t.string :image_url
      t.string :background
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end

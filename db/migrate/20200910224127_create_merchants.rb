class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :saying
      t.string :image_url
      t.integer :gender
      t.integer :game_id
      t.integer :user_id

      t.timestamps
    end
  end
end

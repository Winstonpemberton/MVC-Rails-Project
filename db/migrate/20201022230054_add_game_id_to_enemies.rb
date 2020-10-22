class AddGameIdToEnemies < ActiveRecord::Migration[6.0]
  def change
    add_column :enemies, :game_id, :integer
  end
end

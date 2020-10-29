class AddCharacterIdToWeapons < ActiveRecord::Migration[6.0]
  def change
    add_column :weapons, :character_id, :integer
  end
end

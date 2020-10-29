class AddCharacterIdToArmors < ActiveRecord::Migration[6.0]
  def change
    add_column :armors, :character_id, :integer
  end
end

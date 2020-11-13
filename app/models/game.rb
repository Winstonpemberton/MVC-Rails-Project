class Game < ApplicationRecord
  has_one :merchant
  has_one :boss
  has_one :enemy

  has_many :characters
  has_many :users, through: :characters

  has_many :merchants
  has_many :users, through: :merchants

  # accepts_nested_attributes_for :merchants, :characters

  def set_current_character(character)
    character
  end

  def determine_enemy(key)
    case key
         
    when "enemy"  
      if self.enemy == nil
        Enemy.create(name: "Big Bad Demon", damage: 10, health: 20, game_id: self.id)
      else 
        self.enemy
      end
    when "boss"
      if self.boss == nil
        Boss.create(name: "Big Bad Boss Demon", damage: 30, health: 50, game_id: @game.id)
      else 
        self.boss
      end
    end

  end

  def self.determine_enemy(key, enemy_id)
    if key == "Enemy"
      Enemy.find(enemy_id)
    else 
      Boss.find(enemy_id)
    end
  end

end

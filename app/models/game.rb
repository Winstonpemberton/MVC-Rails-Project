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
        Boss.create(name: "Big Bad Boss Demon", damage: 30, health: 50, game_id:  self.id)
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

  def self.continue_battle?(enemy, character) 
    enemy.health > 0 && character.health
  end

  def self.game_beaten?(enemy)
    enemy.health <= 0 && enemy.class.name == "Boss" 
  end

  def self.character_defeated?(character, enemy) 
    character.health <= 0 && enemy.health > 0 
  end

  def self.enemy_defeated?(character, enemy)
    enemy.health < 0 && character.health > 0
  end
end

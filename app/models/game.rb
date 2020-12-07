class Game < ApplicationRecord
  has_one :merchant
  has_one :boss
  has_one :enemy

  has_many :characters
  has_many :users, through: :characters

  has_many :merchants
  has_many :users, through: :merchants

  # accepts_nested_attributes_for :merchants, :characters

  # determines what enemy to create depending on the link the user clocks on 
  def determine_enemy(key)
    case key
    
    # if it's enemy, an enemy object is created and associated with the current game 
    when "enemy"  
      if self.enemy == nil
        Enemy.create(name: "Big Bad Demon", damage: 10, health: 20, game_id: self.id)
      else 
        self.enemy
      end
    
    # if it's boss, a boss object is created and associated with the current game 
    when "boss"
      if self.boss == nil
        Boss.create(name: "Big Bad Boss Demon", damage: 30, health: 50, game_id:  self.id)
      else 
        self.boss
      end
    end

  end

  # helper method to determine which enemy the character is currently fighting 
  def self.determine_enemy(key, enemy_id)
    if key == "Enemy"
      Enemy.find(enemy_id)
    else 
      Boss.find(enemy_id)
    end
  end

  # helper method to check if both the enemy and character have health left 
  def self.continue_battle?(enemy, character) 
    enemy.health > 0 && character.health > 0 
  end

  # checks if the character beats a boss type enemy 
  def self.game_beaten?(enemy)
    enemy.health <= 0 && enemy.class.name == "Boss" 
  end

  # checks to see if the player's character doesn't have any help and the enemy does 
  def self.character_defeated?(character, enemy) 
    character.health <= 0 && enemy.health > 0 
  end

  # checks to see if the player defeated an enemy
  def self.enemy_defeated?(character, enemy)
    enemy.health < 0 && character.health > 0
  end
end

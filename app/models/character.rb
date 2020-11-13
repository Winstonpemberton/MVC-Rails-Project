class Character < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_one :inventory
  has_one :weapon
  has_one :armor
  has_many :potions

  def attack(enemy)
    weapon = self.weapon
    armor = self.armor

    enemy.update(:health => (enemy.health - weapon.damage))
    self.update(:health => (self.health - (enemy.damage - armor.armor_rating)))
    "you attacked #{enemy.name} for #{weapon.damage} damage and recieved #{enemy.damage} damage"
  end

  def use_potion
    if self.potions.size > 0
      potion = self.potions.last
      self.update(:health => (self.health + potion.heal_amount))
      self.potions.last.destroy
      "You used #{potion.name} and healed #{potion.heal_amount} points!"
    else
      "No potions left"
    end
  end

  # def determine_enemy(key, enemy_id)
  #   if key == "Enemy"
  #     enemy = Enemy.find(enemy_id)
  #   else 
  #     enemy = Boss.find(enemy_id)
  #   end
  # end

  def update_health(enemy)
    self.update(:health => (character.health - (enemy.damage - character.armor.armor_rating)))
  end

  def revive
    self.update(:health => (character.health + 50))
  end

  def recieve_gold
    self.update(:gold => (character.gold + 15))
  end

end

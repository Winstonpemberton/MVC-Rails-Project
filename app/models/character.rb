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
  end

  def use_potion
    if self.potions > 0
      potion = self.potions.last
      self.update(:health => (self.health + potion.heal_amount))
    else
      "No potions left"
    end
  end
end

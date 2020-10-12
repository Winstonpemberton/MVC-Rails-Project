class Character < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :inventories

  def attack(enemy)
    weapon = self.invetory.weapons.last
    armor = self.invetory.armor.last

    enemy.update(:health => (enemy.health - weapon.damage))
    self.update(:health => (self.health - (enemy.damage - armor.armor_rating)),
                    :gold => (self.gold + 15))
  end

  def use_potion
    potion = self.invetory.potions.last
    self.update(:health => (self.health + potion.heal_amount))
  end
end

class Character < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :inventories

  def attack(enemy)
    weapon = character.invetory.weapons.last
    armor = character.invetory.armor.last
    enemy.update (:health => (enemy.health - weapon.damage))
    character.update(:health => (character.health - (enemy.damage - armor.armor_rating))
                    :gold => (character.gold + 15))
  end

  def use_potion
    potion = character.invetory.potions.last
    character.update(:health => (character.health + potion.heal_amount))
  end
end

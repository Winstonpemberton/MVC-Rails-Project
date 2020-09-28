class Character < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :inventories

  def attack(enemy)
    weapon = character.invetory.weapons.last
    enemy.update (:health => (enemy.health - weapon.damage))
    character.update(:health => (character - enemy.damage)
                    :gold => (character.gold + 15))
  end

  def item_transaction(item, character)
    # item.invetory = character.invetory
    character.update(:gold => (character.gold - item.cost))
  end

end

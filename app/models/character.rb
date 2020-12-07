class Character < ApplicationRecord

  # scope method for sorting the created characters by name 
  scope :sort_by_name, -> { order(name: :asc) }
  # scope method for getting only the characters who have above 10 gold 
  scope :gold_above_10, -> { where("gold > 10") }

  validates :name, presence: true
  validates :background, presence: true
  
  belongs_to :game
  belongs_to :user
  has_one :inventory
  has_one :weapon
  has_one :armor
  has_many :potions

  # enemy objects get their health amount reduced by the damage of the weapon the character is holding 
  # characters get damaged per hit and hit is determined by how much damage an enemy has and the amount of damage is reduced by the current armor the character has on

  def attack(enemy)
    weapon = self.weapon
    armor = self.armor

    enemy.update(:health => (enemy.health - weapon.damage))
    self.update(:health => (self.health - (enemy.damage - armor.armor_rating)))
    "you attacked #{enemy.name} for #{weapon.damage} damage and recieved #{enemy.damage} damage"
  end

  # heals the character and removes it from the characters inventory and displays empty if there's no more
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

  # helper method to update character health
  def update_health(enemy)
    self.update(:health => (self.health - (enemy.damage - self.armor.armor_rating)))
  end

  # helper method for when a character losses all of their health and are brought back to the character page
  def revive
    self.update(:health => (self.health + 50))
  end

  # helper method for giving gold to the character after an enemy is defeated
  def receive_gold
    self.update(:gold => (self.gold + 15))
  end

end

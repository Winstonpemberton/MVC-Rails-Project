class Inventory < ApplicationRecord
  belongs_to :character

  has_many :weapons
  has_many :armors
  has_many :potions

end

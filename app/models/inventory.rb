class Inventory < ApplicationRecord
  belongs_to :character

  has_many :weapons
  has_many :merchants, through: :weapons

  has_many :armors
  has_many :merchants, through: :armors

  has_many :potions
  has_many :merchants, through: :potions
end

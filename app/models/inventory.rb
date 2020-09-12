class Inventory < ApplicationRecord
  belongs_to :character

  has_many :merchants
  has_many :weapons, through: :merchants

  has_many :merchants
  has_many :armors, through: :merchants

  has_many :merchants
  has_many :potions, through: :merchants
end

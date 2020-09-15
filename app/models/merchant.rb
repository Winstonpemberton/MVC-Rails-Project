class Merchant < ApplicationRecord

  has_many :weapons
  has_many :inventories, through: :weapons

  has_many :armors
  has_many :inventories, through: :armors

  has_many :potions
  has_many :inventories, through: :potions

  belongs_to :inventory
  belongs_to :weapon
  belongs_to :armor
  belongs_to :potion
end

class Weapon < ApplicationRecord
  has_many :merchents
  has_many :inventories, through: :merchents
end

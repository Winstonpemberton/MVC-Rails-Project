class Weapon < ApplicationRecord
  belongs_to :inventory, optional: true
  belongs_to :merchant, optional: true
  belongs_to :character, optional: true
  has_one_attached :picture
end

class Weapon < ApplicationRecord
  belongs_to :inventory, optional: true
  belongs_to :merchant
  has_one_attached :picture
end

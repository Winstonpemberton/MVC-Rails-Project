class Armor < ApplicationRecord
  belongs_to :inventory, optional: true
  belongs_to :merchant, optional: true
  has_one_attached :picture
end

class Potion < ApplicationRecord
  belongs_to :character, optional: true
  belongs_to :merchant, optional: true
  has_one_attached :picture
end

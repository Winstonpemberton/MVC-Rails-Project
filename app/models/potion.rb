class Potion < ApplicationRecord
  belongs_to :inventory
  belongs_to :merchent
  has_one_attached :picture
end

class Merchant < ApplicationRecord
  belongs_to :inventory
  belongs_to :weapon
  belongs_to :armor
  belongs_to :potion
end

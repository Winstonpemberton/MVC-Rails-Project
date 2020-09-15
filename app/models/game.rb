class Game < ApplicationRecord
  belongs_to :user
  belongs_to :character
  has_many :merchants
  has_many :enemies
  has_many :bosses
end

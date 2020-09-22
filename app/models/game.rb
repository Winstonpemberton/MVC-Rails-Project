class Game < ApplicationRecord
  has_many :merchants
  has_many :enemies
  has_many :bosses

  has_many :characters
  has_many :users, through: :characters

  def current_character(character)
    character
  end

end

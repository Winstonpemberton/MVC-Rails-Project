class Game < ApplicationRecord
  has_many :merchants
  has_many :bosses
  has_many :enemies

  has_many :characters
  has_many :users, through: :characters

  has_many :npcs
  has_many :users, through: :npcs

  accepts_nested_attributes_for :merchants, :characters

  def set_current_character(character)
    character
  end

end

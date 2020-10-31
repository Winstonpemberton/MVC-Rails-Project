class Game < ApplicationRecord
  has_one :merchant
  has_one :boss
  has_one :enemy

  has_many :characters
  has_many :users, through: :characters

  has_many :npcs
  has_many :users, through: :npcs

  # accepts_nested_attributes_for :merchants, :characters

  def set_current_character(character)
    character
  end

end

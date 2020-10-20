class User < ApplicationRecord
  validates :name, presence: true
  has_secure_password
  
  has_many :characters
  has_many :games, through: :characters

  has_many :npcs
  has_many :games, through: :npcs

  # def set_current_game(game)
  #   game
  # end
end

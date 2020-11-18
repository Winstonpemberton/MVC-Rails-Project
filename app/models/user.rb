class User < ApplicationRecord
  validates :name, presence: true
  validates :password, presence: true
  has_secure_password
  
  has_many :characters
  has_many :games, through: :characters

  has_many :merchants
  has_many :games, through: :merchants

  # def set_current_game(game)
  #   game
  # end
end

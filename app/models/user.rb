class User < ApplicationRecord
  validates :name, presence: true

  has_many :characters
  has_many :games, through: :characters

  def set_current_game(game)
    game
  end
end

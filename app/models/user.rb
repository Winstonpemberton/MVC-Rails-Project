class User < ApplicationRecord
  validates :name, presence: true

  has_many :games
  has_many :characters, through: :games
end

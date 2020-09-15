class User < ApplicationRecord
  validates :name, presence: true

  has_many :characters
  has_many :games, through: :characters
end

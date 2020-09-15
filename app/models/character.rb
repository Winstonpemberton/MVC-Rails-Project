class Character < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :inventories
end

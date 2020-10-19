class Enemy < ApplicationRecord
  belongs_to :game
  belongs_to :character
end

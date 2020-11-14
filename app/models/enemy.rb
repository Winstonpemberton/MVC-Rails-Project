class Enemy < ApplicationRecord
  belongs_to :game

  def which_enemy?
    self.class.name == "Enemy"
  end
end

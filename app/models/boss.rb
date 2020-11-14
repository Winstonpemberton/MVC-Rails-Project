class Boss < ApplicationRecord
  belongs_to :game

  def enemy_type?
    self.class.name == "Boss"
  end
end

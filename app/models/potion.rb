class Potion < ApplicationRecord
  belongs_to :inventory
  belongs_to :merchent
end

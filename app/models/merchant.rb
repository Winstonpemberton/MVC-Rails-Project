class Merchant < ApplicationRecord
  belongs_to :game

  has_many :weapons
  has_many :inventories, through: :weapons

  has_many :armors
  has_many :inventories, through: :armors

  has_many :potions
  has_many :inventories, through: :potions

  def build_merchant
    assign_wares
    assign_merchant_image
  end

  def assign_wares
    all_wares.each do |item|
      item.merchant_id = self.id
    end
  end

  def all_wares
    Array.new.tap |wares|
      wares << Weapons.all
      wares << Armor.all
      wares << Potions.all
    end
  end

  def assign_merchant_image
    case self.gender
      when 1
        self.image_url =
      when 2
        self.image_url =
      when 3
        self.image_url =
      else
        "Error"
      end
  end

end

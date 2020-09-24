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
    merchant_sayings
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

  def merchant_sayings
    self.saying = ["Anaria shola. (Speak your business.)","Bal'a dash, malanore. (Greetings, traveler.)"
,"We will persevere!","Our enemies will fall!","Victory lies ahead!"
,"Anu belore dela'na. (The sun guides us.)","What business have you?",
"Glory to the sin'dorei.","Yes?","State your business.","The eternal sun guides us.",
"The dark times will pass."]
  end

  def buy_item (item, character)


  end



end

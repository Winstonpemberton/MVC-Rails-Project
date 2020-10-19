class Merchant < ApplicationRecord
  belongs_to :game

  has_many :weapons
  has_many :armors
  has_many :potions

  def build_merchant
    assign_wares
    assign_merchant_image
    merchant_sayings
  end

  def genders
    ['male','female','A being beyong comprehension']
  end

  def assign_wares
    all_wares.each do |item|
      item.merchant_id = self.id
    end
  end

  def all_wares
    wares = []
    wares << Weapon.all
    wares << Armor.all
    wares << Potion.all
    wares
  end

  # def assign_merchant_image
  #   case self.gender
  #     when 1
  #       self.image_url =
  #     when 2
  #       self.image_url =
  #     when 3
  #       self.image_url =
  #     else
  #       "Error"
  #   end
  # end

  def merchant_sayings
    self.saying = ["Anaria shola. (Speak your business.)", "Bal'a dash, malanore. (Greetings, traveler.)", "We will persevere!", "Our enemies will fall!", "Victory lies ahead!", "Anu belore dela'na. (The sun guides us.)","What business have you?", "Glory to the sin'dorei.","Yes?","State your business.","The eternal sun guides us.","The dark times will pass."]
  end

  def buy_item (item, character)

    if item.invetory != character.invetory
      if character.gold > item.cost
        item_transaction(item, character)
        "you bought #{item.name}!"
      else
        "you don't have enough money"
      end
    else
      "Your character already has this item in their invetory"
    end
  end

  def item_transaction(item, character)
    character.invetory << item
    character.update(:gold => (character.gold - item.cost))
  end

end

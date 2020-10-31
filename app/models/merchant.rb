class Merchant < ApplicationRecord
  belongs_to :game

  has_many :weapons
  has_many :armors
  has_many :potions

  def build_merchant
    assign_wares
    # assign_merchant_image
    merchant_sayings
  end

  def genders
    ['male','female','A being beyong comprehension']
  end

  def assign_wares
    create_weapons 
    create_armors
    create_potions
  end

  def create_weapons 
    weapon = Weapon.create(name: 'Steel Sword', damage: 8, cost: 0, :merchant_id => self.id)
    # weapon.picture.attach(io: File.open('app/assets/images/weapons/steel sword.PNG'),
    # filename: 'steel sword.PNG')

    weapon1 = Weapon.create(name: 'Orcish Sword', damage: 15, cost: 15, :merchant_id => self.id )
    # weapon1.picture.attach(io: File.open('app/assets/images/weapons/orcish sword.PNG'),
    # filename: 'orcish sword.PNG')

    weapon2 = Weapon.create(name: 'Dawnbreaker', damage: 25, cost: 30, :merchant_id => self.id )
    # weapon2.picture.attach(io: File.open('app/assets/images/weapons/dawnbreaker.PNG'),
    # filename: 'dawnbreaker.PNG')
  end
  
  def create_armors 
    armor = Armor.create(name: 'Light Armor', armor_raiting: 5, cost: 0, :merchant_id => self.id)

    armor1 = Armor.create(name: 'Medium Armor', armor_raiting: 10, cost: 15, :merchant_id => self.id)

    armor2 = Armor.create(name: 'Dragonbone Armor', armor_raiting: 15 , cost: 45, :merchant_id => self.id )

  end

  def create_potions
    potion = Potion.create(name: 'Basic Healing Potion', heal_amount: 10, cost: 10, :merchant_id => self.id)

    potion1 = Potion.create(name: 'Superior Healing Potion', heal_amount: 25, cost: 20, :merchant_id => self.id)

    potion2 = Potion.create(name: 'Full Heal Potion', heal_amount: 50, cost: 45, :merchant_id => self.id )

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

    if item.inventory == nil
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
    
      case item.class.name

      when "Weapon"
        item.inventory = character.inventory
        character.inventory.weapons << item
        # item.merchant == nil
      when "Armor"
        item.inventory = character.inventory
        character.inventory.armors << item
        # item.merchant == nil
      else
        "Error"
      end
    character.update(:gold => (character.gold - item.cost))
  end

end

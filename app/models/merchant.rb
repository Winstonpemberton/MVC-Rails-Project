class Merchant < ApplicationRecord
  # scope :all_wares, -> { select("weapons, armors, potions") }

  validates :name, presence: true
  validates :background, presence: true

  belongs_to :game
  belongs_to :user
  has_many :weapons
  has_many :armors
  has_many :potions

  # runs the methods need for a merchant 
  def build_merchant
    assign_wares
    # assign_merchant_image
    merchant_sayings
  end

  # player can choose a gender for a merchant 
  def genders
    ['male','female','A being beyong comprehension']
  end

  # runs the methods the create associations between items and merchants 
  def assign_wares
    create_weapons 
    create_armors
    create_potions
  end

  # creates the association for weapons 
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

  # creates the association for armor 
  def create_armors 
    armor = Armor.create(name: 'Light Armor', armor_rating: 5, cost: 0, :merchant_id => self.id)

    armor1 = Armor.create(name: 'Medium Armor', armor_rating: 10, cost: 15, :merchant_id => self.id)

    armor2 = Armor.create(name: 'Dragonbone Armor', armor_rating: 15 , cost: 45, :merchant_id => self.id )

  end

  # creates the association for potions 
  def create_potions
    potion = Potion.create(name: 'Basic Healing Potion', heal_amount: 10, cost: 10, :merchant_id => self.id)

    potion1 = Potion.create(name: 'Superior Healing Potion', heal_amount: 25, cost: 20, :merchant_id => self.id)

    potion2 = Potion.create(name: 'Full Heal Potion', heal_amount: 50, cost: 45, :merchant_id => self.id )

  end

# wanted to do pictures but will leave that for future development
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

  # loads the merchant up with sayings to say when the user goes to the merchant 
  def merchant_sayings
    self.saying = ["Anaria shola. (Speak your business.)", "Bal'a dash, malanore. (Greetings, traveler.)", "We will persevere!", "Our enemies will fall!", "Victory lies ahead!", "Anu belore dela'na. (The sun guides us.)","What business have you?", "Glory to the sin'dorei.","Yes?","State your business.","The eternal sun guides us.","The dark times will pass."]
  end

  # finds the item that the player selected 
  def determine_item(item_type, item_id)
    case item_type
         
    when "weapon_id"
      Weapon.find(item_id) 
    when "armor_id"
      Armor.find(item_id)
    when "potion_id"
      Potion.find(item_id)
    end
  end
  # checks to see if the player has enough gold to afford the item if so, it procceds with the transaction 
  def buy_item (item, character)
    
    if item.inventory == nil 
      if character.gold >= item.cost
        item_transaction(item, character)
        "you bought #{item.name}!"
      else
        "you don't have enough money"
      end
    else
      "Your character already has this item in their invetory"
    end
  end

  #  checks to see if the player has enough gold and if they do it creates the association between the two
  def buy_potion(potion, character)
    if character.gold >= potion.cost
      item_transaction(potion, character)
      "you bought a #{potion.name}!"
    else
      "you don't have enough money"
    end
  end

# creates a association between a character's inventory and an item
  def item_transaction(item, character)
    
      case item.class.name

      when "Weapon"
        item.inventory = character.inventory
        character.inventory.weapons << item
      when "Armor"
        item.inventory = character.inventory
        character.inventory.armors << item
      when "Potion"
        item.character = character
        character.potions << item
      else
        "Error"
      end
    character.update(:gold => (character.gold - item.cost))
  end

  # checks to see if its a potion item 
  def self.is_potion?(item)
    item.class.name == "Potion"
  end

  # helper method for getting a character object from a merchant object
  def get_character_from_game
    self.game.characters.last
  end

end

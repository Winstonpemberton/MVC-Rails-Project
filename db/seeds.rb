# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@weapon1 = Weapon.create(name: 'Steel Sword', damage: 8 )
@weapon1.picture.attach(io: File.open('app/assets/images/weapons/steel sword.PNG'),
filename: 'steel sword.PNG')

@weapon2 = Weapon.create(name: 'Orcish Sword', damage: 15 )
@weapon2.picture.attach(io: File.open('app/assets/images/weapons/orcish sword.PNG'),
filename: 'orcish sword.PNG')

@weapon3 = Weapon.create(name: 'Dawnbreaker', damage: 25 )
@weapon3.picture.attach(io: File.open('app/assets/images/weapons/dawnbreaker.PNG'),
filename: 'dawnbreaker.PNG')
#
# Armor.create(name: 'Light Armor', armor_raiting: 5 )
# Armor.create(name: 'Medium Armor', armor_raiting: 10 )
# Armor.create(name: 'Dragonbone Armor', armor_raiting: 15 )
#
# Potion.create(name: 'Basic Healing Potion', heal_amount: 10 )
# Potion.create(name: 'Superior Healing Potion', heal_amount: 25 )
# Potion.create(name: 'Full Heal Potion', heal_amount: 50 )

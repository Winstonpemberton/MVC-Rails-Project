# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Weapon.create(name: 'Dull Sword', damage: 8 )
Weapon.create(name: 'Epic Sword', damage: 15 )
Weapon.create(name: 'Dawnbreaker', damage: 25 )

Armor.create(name: 'Light Armor', armor_raiting: 5 )
Armor.create(name: 'Medium Armor', armor_raiting: 10 )
Armor.create(name: 'Dragonbone Armor', armor_raiting: 15 )

Potion.create(name: 'Basic Healing Potion', heal_amount: 10 )
Potion.create(name: 'Superior Healing Potion', heal_amount: 25 )
Potion.create(name: 'Full Heal Potion', heal_amount: 50 )

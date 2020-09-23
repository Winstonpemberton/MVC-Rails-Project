class WeaponsController < ApplicationController
  def show
    @weapon = Weapon.find(params[:id])
    @inventory = current_character.inventory
  end
end

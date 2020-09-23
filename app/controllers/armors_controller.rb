class ArmorsController < ApplicationController
  def show
    @armor = Armor.find(params[:id])
    @inventory = current_character.inventory
  end
end

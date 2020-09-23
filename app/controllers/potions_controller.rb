class PotionsController < ApplicationController
  def show
    @potion = Potion.find(params[:id])
    @inventory = current_character.inventory
  end
end

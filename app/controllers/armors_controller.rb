class ArmorsController < ApplicationController
  def show
    @armor = Armor.find(params[:id])
  end
end

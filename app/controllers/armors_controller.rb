class ArmorsController < ApplicationController
  def index
    @armor = Armor.all
  end

  def show
    @armor = Armor.find(params[:id])
  end
end

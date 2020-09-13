class WeaponsController < ApplicationController
  def index
    @weapon = Weapon.all
  end

  def show
    @weapon = Weapon.find(params[:id])
  end
end

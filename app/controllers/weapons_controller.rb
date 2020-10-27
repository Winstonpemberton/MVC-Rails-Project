class WeaponsController < ApplicationController
  def show
    @weapon = Weapon.find(params[:id])
  end
end

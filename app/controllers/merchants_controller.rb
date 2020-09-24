class MerchantsController < ApplicationController

  def show
    @merchant = Merchant.find(params[:id])
  end

  def buy_item
    merchant = Merchant.find(params[:merchant_id])
    item = Weapon.find(params[:weapon_id]) if != nil
    item = Armor.find(params[:armor_id]) if != nil
    item = Weapon.find(params[:potion_id]) if != nil
    inventory = current_user.inventory

    if merchant
      response = merchant.buy_item(item, inventory)
      flash[:notice] = response
      redirect_to user_path(ride.user)
    else
      redirect_to attraction_path(ride.attraction)
    end
  end

end

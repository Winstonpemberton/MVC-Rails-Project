class MerchantsController < ApplicationController

  def show
    @merchant = Merchant.find(params[:id])
    
  end

  def buy_item
    merchant = Merchant.find(params[:merchant_id])
    item = Weapon.find(params[:weapon_id]) if item != nil
    item = Armor.find(params[:armor_id]) if item != nil
    item = Weapon.find(params[:potion_id]) if item != nil

    if merchant
      response = merchant.buy_item(item, current_character)
      flash[:notice] = response
      redirect_to user_character_path(current_character)
    else
      redirect_to merchant_path(@merchant)
    end
  end

end

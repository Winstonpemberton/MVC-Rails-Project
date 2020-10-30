class MerchantsController < ApplicationController

  def show
    @merchant = Merchant.find(params[:id])

  end

  def buy_item
    merchant = Merchant.find(params[:merchant_id])

      case params.keys.second
        
      when "weapon_id"
        item = Weapon.find(params[:weapon_id]) 
      when "armor_id"
        item = Armor.find(params[:armor_id])
      when "potion_id"
        item = Potion.find(params[:potion_id])
      else
        "errrrror"
      end


    if merchant
      response = merchant.buy_item(item, merchant.game.characters.last)
      flash[:notice] = response
      redirect_to user_character_path(current_user, merchant.game.characters.last) 
    else
      redirect_to merchant_path(merchant)
    end
  end

end

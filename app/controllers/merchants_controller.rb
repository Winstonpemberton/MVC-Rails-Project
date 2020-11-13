class MerchantsController < ApplicationController

  def show
    @merchant = Merchant.find(params[:id])
    @character = @merchant.game.characters.last
  end

  def buy_item
    merchant = Merchant.find(params[:merchant_id])

    item = merchant.determine_item(params.keys.second)

      # case params.keys.second
         
      # when "weapon_id"
      #   item = Weapon.find(params[:weapon_id]) 
      # when "armor_id"
      #   item = Armor.find(params[:armor_id])
      # when "potion_id"
      #   potion = Potion.find(params[:potion_id])
      # else
      #   "Something went wrong"
      #   user_character_path(current_user, merchant.game.characters.last) 
      # end
      
    if item
      response = merchant.buy_item(item, merchant.game.characters.last)
      flash[:notice] = response
      redirect_to user_character_path(current_user, merchant.game.characters.last) 
    elsif potion
      response = merchant.buy_potion(potion, merchant.game.characters.last)
       flash[:notice] = response
       redirect_to user_character_path(current_user, merchant.game.characters.last) 
    end
  end

end

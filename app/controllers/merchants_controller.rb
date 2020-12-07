class MerchantsController < ApplicationController
  
  # loads the show page for merchants 
  def show
    @merchant = Merchant.find(params[:id])
    @character = @merchant.get_character_from_game
  end

  # runs the method to associate a character with a user selected item 
  def buy_item
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.determine_item(params.keys.second, params.values.second )
    
    # potions run differently since a user can have multiple of the item, so it checks if it is a potion
    if Merchant.is_potion?(item)
      response = merchant.buy_potion(item, merchant.get_character_from_game)
      flash[:notice] = response
      redirect_to user_character_path(current_user, merchant.get_character_from_game) 
    
    # if not it runs the normal buy method 
    else 
      response = merchant.buy_item(item, merchant.get_character_from_game)
      flash[:notice] = response
      redirect_to user_character_path(current_user, merchant.get_character_from_game) 
    end
  end

end

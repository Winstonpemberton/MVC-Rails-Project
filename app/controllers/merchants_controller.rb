class MerchantsController < ApplicationController

  def show
    @merchant = Merchant.find(params[:id])
    @character = @merchant.get_character_from_game
  end

  def buy_item
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.determine_item(params.keys.second, params.values.second )

    if Merchant.is_potion?(item)
      response = merchant.buy_potion(item, merchant.get_character_from_game)
      flash[:notice] = response
      redirect_to user_character_path(current_user, merchant.get_character_from_game) 
    else 
      response = merchant.buy_item(item, merchant.get_character_from_game)
      flash[:notice] = response
      redirect_to user_character_path(current_user, merchant.get_character_from_game) 
    end
  end

end

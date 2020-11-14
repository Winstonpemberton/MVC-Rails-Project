class MerchantsController < ApplicationController

  def show
    @merchant = Merchant.find(params[:id])
    @character = @merchant.game.characters.last
  end

  def buy_item
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.determine_item(params.keys.second, params.values.second )

    if Merchant.is_potion?(item)
      response = merchant.buy_potion(item, merchant.game.characters.last)
      flash[:notice] = response
      redirect_to user_character_path(current_user, merchant.game.characters.last) 
    else 
      response = merchant.buy_item(item, merchant.game.characters.last)
      flash[:notice] = response
      redirect_to user_character_path(current_user, merchant.game.characters.last) 
    end
  end

end

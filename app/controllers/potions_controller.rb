class PotionsController < ApplicationController
  def show
    @potion = Potion.find(params[:id])
  end
end

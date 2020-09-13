class PotionsController < ApplicationController
  def index
    @potion = Potion.all
  end

  def show
    @potion = Potion.find(params[:id])
  end
end

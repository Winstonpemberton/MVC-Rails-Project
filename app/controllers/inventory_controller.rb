class InventoryController < ApplicationController
    def show
        @inventory = Inventory.find(params[:id])
    end
end
  
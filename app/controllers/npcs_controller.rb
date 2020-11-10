class NpcsController < App
    
    licationController
    def show
        @npc = Npc.find(params[:id])
    end

    def index 
        @npcs = Npc

    end

  end
  
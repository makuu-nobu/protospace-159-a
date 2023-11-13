class ProtospacesController < ApplicationController
    def index
        @prototypes = Prototype.all        
    end
    def new
        @protospace = Prototype.new
    end
    def create
        @prototype = Prototype.create(prototype_params)
        if @prototype.save
            redirect_to root_path          
        else
            render :new
        end
        
    end

    private
    def prototype_params
        #devise導入後にuser_idをmergeで付け加える
        params.require(:prototype).permit(:title, :catch_copy, :concept).merge(user_id: current_user.id)
    end
end

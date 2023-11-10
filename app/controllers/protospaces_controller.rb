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
            render :new, status: unprocessable_entity
        end
        
    end

    def edit
        @prototype = Prototype.find(params[:id])
    end

    def update
        prototype = Prototype.find(params[:id])
        prototype.update(prototype_params)
        redirect_to root_path
    end

    private
    def prototype_params
        #devise導入後にuser_idをmergeで付け加える
        params.require(:prototype).permit(:title, :catch_copy, :concept).merge(user_id: current_user.id)
    end
end

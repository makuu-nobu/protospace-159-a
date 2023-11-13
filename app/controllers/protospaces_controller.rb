class ProtospacesController < ApplicationController
    before_action :move_to_index, except: [:index, :show]

    def index
        @prototypes = Prototype.includes(:user)      
    end
    def new
        @prototype = Prototype.new
    end
    def create
        @prototype = Prototype.create(prototype_params)
        if @prototype.save
            redirect_to root_path          
        else
            render :new
        end
    end

    def show
        @comment = Comment.new
        @prototype = Prototype.find(params[:id])        
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
        params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    end

    def move_to_index
        unless user_signed_in?
            redirect_to new_user_session_path
        end      
    end
end

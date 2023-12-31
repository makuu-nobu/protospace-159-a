class ProtospacesController < ApplicationController
    before_action :set_prototype, only: [:edit, :show]
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
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @comment = Comment.new
        @comments = @prototype.comments.includes(:user)    
    end
    
    def edit
        if current_user != @prototype.user
            redirect_to root_path
        end
    end

    def update
        @prototype = Prototype.find(params[:id])
        if @prototype.update(prototype_params)
            redirect_to prototype_path(params[:id])
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        prototype = Prototype.find(params[:id])
        if current_user != prototype.user
            redirect_to root_path
        else
            prototype.destroy
            redirect_to root_path                 
        end   
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

    def set_prototype
        @prototype = Prototype.find(params[:id])
    end
end

class CommentsController < ApplicationController
    def create
        @comment = Comment.create(comments_params)
        if @comment.save
            redirect_to "/protospaces/#{@comment.prototype.id}"
        else
            redirect_to "/protospaces/#{@comment.id}" , status: :unprocessable_entity
        end
    end

    private
    def comments_params
        params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    end
end

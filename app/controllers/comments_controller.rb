class CommentsController < ApplicationController
  before_filter :load_commentable
  
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end
  
  def create
    @comment = @commentable.comments.new(comment_params)
    if user_signed_in?
      @comment.user = current_user
    end
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end
  
private

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content, :commenter)
  end
end

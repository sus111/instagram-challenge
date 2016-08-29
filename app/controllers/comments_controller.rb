class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @comments = Comment.all
  end

  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to '/pictures'
    else
      redirect_to pictures_path
      flash[:notice] = "Your comment could not be added"
    end
  end

  def show
    @user = User.find(comment.user_id).email
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end

class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.build_with_user(current_user)
    if @like.save

      render json: {new_like_count: @picture.likes.count}
    else
      redirect_to '/pictures'
      flash[:notice] = "You already liked this pic!"
    end
  end

end

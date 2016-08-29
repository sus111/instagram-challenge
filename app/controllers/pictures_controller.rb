class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build_with_user(picture_params, current_user)
    if @picture.save
      redirect_to pictures_path
    else
      render "new"
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to '/pictures'
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    flash[:notice] = "Your picture has been deleted"
    redirect_to '/pictures'
  end

  private

    def picture_params
      params.require(:picture).permit(:title, :image)
    end

end


# <% if picture.user == current_user %>
#   <h5><%= link_to picture.title, edit_picture_path(picture) %></h5>
#   <h5><%= link_to "Delete", picture_path(picture), method: :delete %></h5>
# <%= end %>

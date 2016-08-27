class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to '/pictures'
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    picture = Picture.find(params[:id])
    picture.update(picture_params)
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

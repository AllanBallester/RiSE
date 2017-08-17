class PhotosController < ApplicationController
before_action :authenticate_riser!, only: [:new, :create, :update]

  def new
    @photo = Photo.new
    @homeless = Homeless.find(params[:homeless_id])
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.homeless = Homeless.find(params[:homeless_id])
    if @photo.save
      redirect_to homeless_path(@photo.homeless)
    else
      puts @photo.errors.messages
      render :new
    end
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to homeless_path(@homeless)
  end


  def photo_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:photo).permit(:picture, :picture_cache)
end
end

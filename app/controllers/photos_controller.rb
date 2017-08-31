class PhotosController < ApplicationController
  before_action :authenticate_riser!, only: [:new, :create, :update, :sign_in]

  def new
    @photo = Photo.new
    @homeless = Homeless.find(params[:homeless_id])
  end

  def sign_in
    @homeless = Homeless.find(params[:homeless_id])
    redirect_to homeless_path(@homeless)
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.homeless = Homeless.find(params[:homeless_id])
    if @photo.save
      redirect_to homeless_path(@photo.homeless)
    else
      flash[:alert] = "Oops !!! And your picture ?"
      redirect_to homeless_path(@photo.homeless)
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

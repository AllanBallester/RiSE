class HomelessesController < ApplicationController
  before_action :authenticate_riser!, only: [:new, :create, :edit]

  def index
    @homelesses = Homeless.near(params[:location], 200)

    @hash = Gmaps4rails.build_markers(@homelesses) do |homeless, marker|
      marker.lat homeless.latitude
      marker.lng homeless.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @homeless = Homeless.includes(:reviews).find(params[:id])
    @review = Review.new
    @photo = Photo.new
    @intention = Intention.new

    @hash = Gmaps4rails.build_markers(@homeless) do |homeless, marker|
      marker.lat homeless.latitude
      marker.lng homeless.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

  end

  def new
    @homeless= Homeless.new
    @photo = Photo.new
  end

  def create
    @homeless = Homeless.new(homeless_params)
    if @homeless.save
      redirect_to homeless_path(@homeless)
    elsif Homeless.where(name:@homeless.name, last_name:@homeless.last_name).present?
      flash[:alert] = "Oops !!! The Riser already exist. Find him/her on HomePage and update location. Job done !!"
      redirect_to new_homeless_path
    else
      # flash[:alert] = "Oops !!! Infos are missing. At least name, last name and Location dear Risers !!"
      # redirect_to new_homeless_path
      render 'new'
    end
  end

  def edit
    @homeless = Homeless.find(params[:id])
  end

  def update
    @homeless = Homeless.find(params[:id])
    @homeless.update(homeless_params)

    redirect_to homeless_path(@homeless)
 # We'll see that in a moment.
  end

  def create_interest
    @homeless = Homeless.find(params[:id])
    @intention = @homeless.intentions.new(content: params["intention"]["content"],
                                          riser: current_riser)
    @intention.save

    respond_to do |format|
      format.js
    end

    UserMailer.review(current_riser).deliver_now

  end

  def search
  end

  def retrieve
    @homeless = Homeless.where("name = ? AND last_name = ? ", params[:name], params[:last_name]).first
    respond_to do |format|
      format.js
    end
  end

private

  def homeless_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:homeless).permit(:name, :last_name, :story, :phone, :location, :fb_account )
  end
end

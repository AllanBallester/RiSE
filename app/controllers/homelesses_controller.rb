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
    position_array = [{latitude: @homeless.latitude, longitude: @homeless.longitude, current: true}]

    @hash = Gmaps4rails.build_markers(position_array) do |hash, marker|

      if hash[:current].present?
      marker.picture({
        :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|668CFF|000000", # up to you to pass the proper parameters in the url, I guess with a method from device
        :width   => 32,
        :height  => 32
        })
      end

      marker.lat hash[:latitude]
      marker.lng hash[:longitude]
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

  end

  def new
    @homeless= Homeless.new
    @photo = Photo.new
  end

  def create
    @homeless = Homeless.new(homeless_params)
    @homeless.riser = current_riser
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
    if @intention.save

      position_array = [{latitude: @homeless.latitude, longitude: @homeless.longitude, current: true}]
      @homeless.position_histories.limit(4).each do |history|
        position_array << {latitude: history.latitude, longitude: history.longitude, current: false}
      end

      @hash = Gmaps4rails.build_markers(position_array) do |hash, marker|

        if hash[:current].present?
        marker.picture({
          :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|668CFF|000000", # up to you to pass the proper parameters in the url, I guess with a method from device
          :width   => 32,
          :height  => 32
          })
        end

        marker.lat hash[:latitude]
        marker.lng hash[:longitude]
        # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
      end



      UserMailer.review(current_riser, @homeless).deliver_now
    end
    respond_to do |format|
      format.js
    end
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

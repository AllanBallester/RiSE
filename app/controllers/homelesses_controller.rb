class HomelessesController < ApplicationController
  def index
    @homelesses = Homeless.all
  end

  def show
    @homeless = Homeless.includes(:reviews).find(params[:id])
    @review = Review.new
  end

  def new
    @homeless= Homeless.new
  end

  def create
    @homeless = Homeless.new(homeless_params)
    @homeless.save
    redirect_to homelesses_path
  end

  def edit
    @homeless = Homeless.find(params[:id])
  end

  def update
    @homeless = Homeless.find(params[:id])
    @homeless.update(homeless_params)

    redirect_to homelesses_path # We'll see that in a moment.
  end

private

  def homeless_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:homeless).permit(:name, :story)
  end
end

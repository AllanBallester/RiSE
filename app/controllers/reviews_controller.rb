class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @homeless = Homeless.find(params[:homeless_id])
  end

  def create
    @review = Review.new(review_params)
    @review.homeless = Homeless.find(params[:homeless_id])
    @review.save
    redirect_to homeless_path(@review.homeless)
  end

  def review_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:review).permit(:content)
end

end

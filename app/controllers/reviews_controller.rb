class ReviewsController < ApplicationController
  before_action :find_restaurant, except: [:destroy]

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to restaurants_path
  end
end

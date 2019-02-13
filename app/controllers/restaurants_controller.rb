class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :destroy]


  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = @restaurant.reviews
  end

  # def edit
  # end

  # def update
  #   @restaurant.update(restaurant_params)
  #   # Will raise ActiveModel::ForbiddenAttributesError
  # end

  # def destroy
  #   @restaurant.destroy

  #   # no need for app/views/restaurants/destroy.html.erb
  #   redirect_to restaurants_path
  # end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category, :reviews)
  end
end

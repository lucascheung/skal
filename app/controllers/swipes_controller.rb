class SwipesController < ApplicationController
  def create
    @swipe = Swipe.create(swiper:current_user, swipee: User.find(params[:user_id]), like: true)
    redirect_to users_path
  end
end

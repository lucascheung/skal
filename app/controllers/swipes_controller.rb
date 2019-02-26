class SwipesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @swipe = Swipe.create(swiper:current_user, swipee: User.find(params[:user_id]), like: true)
  end

  def swiped_right
    Swipe.create(swiper: current_user, swipee: User.find(params[:user_id]), like: true)
  end

  def swiped_left
    Swipe.create(swiper: current_user, swipee: User.find(params[:user_id]), like: false)
  end
end

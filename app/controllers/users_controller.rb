class UsersController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index]
  def index
    @swiped_id = []
    if current_user.swipes == []
      @users = User.all
    else
      current_user.swipes.each { |swipe| @swiped_id << swipe.swipee.id }
      @users = User.where("id NOT IN (?)", @swiped_id)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def change_preference
    current_user.preference = params[:gender]
  end
end

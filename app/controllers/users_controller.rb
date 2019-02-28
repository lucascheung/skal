require 'pry-byebug'
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:change_preference]
  def index
    @swiped_id = []
    if current_user.swipes == []
      @users = User.where.not('id = ?', current_user.id).where('gender = ?', current_user.preference)
    else
      current_user.swipes.each { |swipe| @swiped_id << swipe.swipee.id }
      @users = User.where.not('id = ?', current_user.id).where("id NOT IN (?)", @swiped_id).where('gender = ?', current_user.preference)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def change_preference
    user = current_user
    user.preference = params[:preference]
    user.save
  end

  def check_match
    @swiped_user = User.find(params[:user_id])
    @swiped = @swiped_user.swipes.map(&:swipee)
    respond_to do |format|
      format.js
    end
  end
end

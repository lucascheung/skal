class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:change_preference, :check_match]
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
    if @swiped.include?(current_user)
      create_match
      render_page(@swiped_user)
    else
      render json: { match: false }
    end
  end

  def render_page(swiped_user)
    render json: { match: true, name: swiped_user.name, photo: swiped_user.photos[0].photo.url, match: @match.id, user: current_user.id }
  end

  def create_match
    bar = Bar.all.sample
    initial_date = generate_meet_up_time
    meet_up_time = MeetUpTime.create(meet_up_time: initial_date, first_user_accepted: false, last_user_accepted: false)
    used = false
    expiry_date = Time.now + (2 * 7 * 24 * 60 * 60)
    location_validated = false
    content = "1 free drink"
    coupon = Coupon.create(used: used, expiry_date: expiry_date, location_validated: location_validated, content: content)
    @match = Match.create(first_user:current_user, last_user: @swiped_user, bar: bar, meet_up_time: meet_up_time, coupon: coupon)
  end

  def generate_meet_up_time
    @date = rand(Date.today..Date.today + 14).to_datetime
    return @date.change(hour: rand(17..22))
  end
end

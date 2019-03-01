class MeetUpTimesController < ApplicationController
  before_action :set_meetup, only: [:accept, :decline]
  def generate_meet_up_time
    @date = rand(Date.today..Date.today + 7).to_datetime
    return @date.change(hour: rand(17..22))
  end

  def accept
    if @meetup.first_user_accepted
      @meetup.last_user_accepted = true
    else
      @meetup.first_user_accepted = true
    end
  end

  def decline
    @meetup.first_user_accepted = false
    @meetup.last_user_accepted = false
    @meetup.meet_up_time = generate_meet_up_time
    @meetup.save
  end

  private

  def set_meetup
    @meetup = MeetUpTime.find(params[:id])
  end
end

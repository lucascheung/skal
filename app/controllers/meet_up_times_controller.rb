class MeetUpTimesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:accept, :decline, :confirmed?]
  def generate_meet_up_time
    @date = rand(Date.today..Date.today + 7).to_datetime
    return @date.change(hour: rand(17..22))
  end

  def accept
    meetup = Match.find(params[:match_id])
    meet_up_time = meetup.meet_up_time
    if meetup.first_user == current_user
      meet_up_time.first_user_accepted = true
    else
      meet_up_time.last_user_accepted = true
    end
    meet_up_time.save
  end

  def decline
    meetup = Match.find(params[:match_id])
    meet_time = meetup.meet_up_time
    meet_time.first_user_accepted = false
    meet_time.last_user_accepted = false
    meet_time.meet_up_time = generate_meet_up_time
    meet_time.save
    render json: { new_time: meet_time.meet_up_time.strftime("%e %B at %l:%M%p") }
  end

  def confirmed?
    meetup = Match.find(params[:match_id])
    meet_time = meetup.meet_up_time
    if meet_time.first_user_accepted && meet_time.last_user_accepted
      render json: { confirmed: 'confirmed' }
    elsif (meetup.first_user == current_user && meet_time.first_user_accepted) || (meetup.last_user == current_user && meet_time.last_user_accepted)
      render json: { confirmed: 'current_accepted' }
    elsif !meet_time.first_user_accepted && !meet_time.last_user_accepted
      render json: { confirmed: 'no_one_accepted' }
    else
      render json: { confirmed: 'match_accepted' }
    end
  end
end

class MeetUpTimesController < ApplicationController
  def generate_meet_up_time
    @date = rand(Date.today..Date.today + 14).to_datetime
    return @date.change(hour: rand(17..22))
  end

  def accepted

  end
end


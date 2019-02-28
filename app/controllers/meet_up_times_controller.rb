class MeetUpTimesController < ApplicationController
  def meetup_generate
    @date = rand(Date.today..Date.today + 14).to_datetime
    @date = @date.change(hour: rand(17..22))
  end

  def accepted

  end
end


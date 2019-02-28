class MeetUpTimesController < ApplicationController
  def meetup_generate
    date = rand(Date.today..Date.today + 14)
    date = date.to_datetime
    date = date.change(hour: rand(17..22))
    return date
  end

  def accepted
    
  end
end


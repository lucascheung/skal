class MeetUpTime < ApplicationRecord
  has_one :match
  
  def both_accepted?
    first_user_accepted && last_user_accepted
  end

  def one_pending?
    last_user_accepted.nil? || first_user_accepted.nil?
  end
end


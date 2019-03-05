class MeetUpTime < ApplicationRecord
  has_one :match
  belongs_to :first_user_accepted, class_name: "User", optional: true
  belongs_to :last_user_accepted, class_name: "User", optional: true

  def both_accepted?
    first_user_accepted && last_user_accepted
  end

  def one_pending?
    last_user_accepted.nil? || first_user_accepted.nil?
  end
end

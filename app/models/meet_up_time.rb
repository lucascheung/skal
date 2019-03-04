class MeetUpTime < ApplicationRecord
  has_one :match
  belongs_to :first_user_accepted, class_name: "User", optional: true
  belongs_to :last_user_accepted, class_name: "User", optional: true
end

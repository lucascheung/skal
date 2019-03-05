class Match < ApplicationRecord
  belongs_to :bar
  belongs_to :meet_up_time
  belongs_to :coupon
  belongs_to :first_user, class_name: "User"
  belongs_to :last_user, class_name: "User"

end

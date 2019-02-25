class Match < ApplicationRecord
  belongs_to :bar
  belongs_to :meet_up_time
  belongs_to :coupon
end

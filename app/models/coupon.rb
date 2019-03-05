class Coupon < ApplicationRecord
  has_one :match

  def in_future?
    expiry_date.to_datetime > Time.now
  end

  def in_past?
    !in_future?
  end
end

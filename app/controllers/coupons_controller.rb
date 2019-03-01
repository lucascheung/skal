class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :destroy, :expired?]

  # use coupon
  # check if coupon has expired
  # change used from 0 to 1
  # only show coupons that have 0 booleans
  # add content message to coupon
  # expired?

  def show
  end

  def create
    used = false
    expiry_date = Time.now + (2 * 7 * 24 * 60 * 60)
    location_validated = false
    content = "1 free drink"
    Coupon.create(used: used, expiry_date: expiry_date, location_validated: location_validated, content: content)
  end

  def used
    @coupon.used = true
  end

  def expired?
    current_time = Time.now
    @coupon.expiry_date < current_time
  end

  def destroy
    @coupon.delete
  end

  private

  def coupon_params
    params.require(:coupon).permit(:expiry_date, :used, :location_validated)
  end

  def set_coupon
    @coupon = Coupon.find(params[:coupon_id])
  end
end

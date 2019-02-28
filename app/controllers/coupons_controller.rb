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
    used = 0
    expiry_date = Time.now + (2*7*24*60*60)
    location_verified = 1
    content = "Free drinks"
    Coupon.create(used: used, expiry_date: expiry_date, location_verified: location_verified, content: content)
  end

  def edit
    @coupon.used = 1
  end

  def expired?
    current_time = Time.now
    true if @coupon.expiry_date < current_time
  end

  def destroy
    @coupon.delete
  end

  private

  def coupon_params
    params.require(:coupon).permit(:expiry_date, :used, :location_verified)
  end

  def set_coupon
    @coupon = Coupon.find(params[:coupon_id])
  end
end

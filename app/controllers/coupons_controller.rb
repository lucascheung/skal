class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :expired?]

  def show
  end

  def create
    expiry_date = Time.now + (1*7*24*60*60)
    location_validated = 1
    content = "2 free drink drink vouchers"
    Coupon.create(used: used, expiry_date: expiry_date, location_validated: location_validated, content: content)
  end

  def edit
    @coupon.used = 1
  end

  def expired?
    current_time = Time.now
    true if @coupon.expiry_date < current_time
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end
end

class CouponsController < ApplicationController

  def index
    @coupons = Coupon.all
  end

  def show
    find_coupon
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.create(coupon_params)
    if @coupon.save
      redirect_to coupon_path(@coupon)
    else
      render :new
    end
  end


  private

  def find_coupon
    @coupon = Coupon.find(params[:id])
  end

  def coupon_params
    params.require(:coupon).permit(:coupon_code, :store)
  end



end

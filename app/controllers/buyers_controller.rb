class BuyersController < ApplicationController

  def index
  end

  def new
    @item = Item.find(params[:item_id])
    @user_buyer = UserBuyer.new
  end

  def create
    binding.pry
    @user_buyer = UserBuyer.new(buyer_params)
    if @user_buyer.valid?
      @user_buyer.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def buyer_params
    params.require(:user_buyer).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end



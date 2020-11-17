class BuyersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @user_buyer = UserBuyer.new
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.buyer != nil
      redirect_to root_path
    end
  end


  def create
    @item = Item.find(params[:item_id])
    @user_buyer = UserBuyer.new(buyer_params)
    if @user_buyer.valid?
      pay_item
      @user_buyer.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.require(:user_buyer).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

end



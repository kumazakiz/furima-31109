require 'rails_helper'
RSpec.describe UserBuyer, type: :model do
  before do
    @buyer = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep 1
    @user_buyer = FactoryBot.build(:user_buyer, user_id: @buyer.id, item_id: @item.id)
  end

  describe '商品購入機能' do

    context '商品購入がうまくいくとき' do
      it "全項目が入力されている時に商品購入ができる。" do
        expect(@user_buyer).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @user_buyer.postal_code = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeにハイフンが入ってないと登録できない" do
        @user_buyer.postal_code = '1234567'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefectures_idが空だと登録できない" do
        @user_buyer.prefectures_id = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Prefectures can't be blank", "Prefectures is not a number")
      end
      it "prefectures_idの選択肢がid:1だと登録できない"do
        @user_buyer.prefectures_id = 1
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "municipalityが空だと登録できない" do
        @user_buyer.municipality = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空だと登録できない" do
        @user_buyer.address = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @user_buyer.phone_number = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include( "Phone number can't be blank", "Phone number please write within 11 digits without hyphens")
      end
      it "phone_numberにハイフンが入っていたら登録できない" do
        @user_buyer.phone_number = '090-123-456'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Phone number please write within 11 digits without hyphens")
      end
      it "phone_numberが10桁以下だったら登録できない" do
        @user_buyer.phone_number = '1234567890'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Phone number please write within 11 digits without hyphens")
      end
      it "phone_numberが12桁以上だったら登録できない" do
        @user_buyer.phone_number = '123456789101'
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Phone number please write within 11 digits without hyphens")
      end
      it "tokenが空では登録できない" do
        @user_buyer.token = nil
        @user_buyer.valid?
        expect(@user_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

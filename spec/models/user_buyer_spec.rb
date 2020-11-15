require 'rails_helper'
RSpec.describe UserBuyer, type: :model do
  before do
    # ユーザー１
    FactoryBot.build(:user)
    # ユーザー２
    # アイテム
    # 画像
    # ユーザー１と２で作った購入情報
    @user_buyer = FactoryBot.build(:user_buyer)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "全項目が入力されている時に商品購入ができる。" do
      end
    end

    context '商品購入がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
      end
      it "postal_codeにハイフンが入ってないと登録できない" do
      end
      it "prefectures_idが空だと登録できない" do
      end
      it "prefectures_idの選択肢がid:1だと登録できない"do
      end
      it "municipalityが空だと登録できない" do
      end
      it "addressが空だと登録できない" do
      end
      it "phone_numberが空だと登録できない" do
      end
      it "phone_numberにハイフンが入っていたら登録できない" do
      end
      it "phone_numberが10桁以下だったら登録できない" do
      end
      it "phone_numberが12桁以上だったら登録できない" do
      end
    end
  end
end

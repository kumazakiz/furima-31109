require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "emailに＠が含まれてないと登録できない" do
      end
      it "encrypted_passwordが空だと登録できない" do
      end
      it "encrypted_passwordが6文字以下だと登録できない" do
      end
      it "encrypted_passwordとpassword_confimationが値が不一致だと登録できない" do
      end
      it "family_nameが空だと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "family_name_kanaが空だと登録できない" do
      end
      it "first_name_kanaが空だと登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
    end
  end
end

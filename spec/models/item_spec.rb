require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規商品登録がうまくいくとき' do
      it '全項目が正しく入力されたら出品登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規商品機能がうまくいかないとき' do
      it 'imageが空白だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空白だと登録できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanationが空白だと登録できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空白だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it 'category_idの選択肢がid:1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'item_status_idが空白だと登録できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank", 'Item status is not a number')
      end
      it 'item_status_idの選択肢がid:1だと登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end
      it 'shipping_cost_idが空白だと登録できない' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank", 'Shipping cost is not a number')
      end
      it 'shipping_cost_idの選択肢がid:1だと登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 1')
      end
      it 'shipping_area_idが空白だと登録できない' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank", 'Shipping area is not a number')
      end
      it 'shipping_area_idの選択肢がid:1だと登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'days_to_ship_idが空白だと登録できない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank", 'Days to ship is not a number')
      end
      it 'days_to_ship_idの選択肢がid:1だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it 'selling_priceが空白だと登録できない' do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank", 'Selling price 300~9,999,999の間で設定してください。', 'Selling price には半角数字のみで設定してください')
      end
      it 'selling_priceが半角数字入力でないと登録できない' do
        @item.selling_price = '３０１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price 300~9,999,999の間で設定してください。')
      end
      it 'selling_priceが¥299以下だと登録できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price 300~9,999,999の間で設定してください。')
      end
      it 'selling_priceが¥10,000,000以上だと登録できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price 300~9,999,999の間で設定してください。')
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

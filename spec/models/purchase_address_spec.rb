require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, product_id: product.id)
    sleep(0.1)
  end

  context '内容に問題ない場合' do
    it "すべての値が正しく入力されていれば保存ができること" do
      expect(@purchase_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
    end
    it 'postal_codeが全角のハイフンだと保存できないこと' do
      @purchase_address.postal_code = '123ー4567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
    end
    it 'postal_codeが半角文字だと保存できないこと' do
      @purchase_address.postal_code = 'aaa-aaaa'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
    end
    it 'postal_codeが全角だと保存できないこと' do
      @purchase_address.postal_code = '１２３-４５６７'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @purchase_address.prefecture_id = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1だと保存できないこと' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'municipalityが空だと保存できないこと' do
      @purchase_address.municipality = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @purchase_address.address = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが9桁以下だと保存できないこと' do
      @purchase_address.phone_number = '123456789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが12桁以下だと保存できないこと' do
      @purchase_address.phone_number = '012345678912'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが半角文字だと保存できないこと' do
      @purchase_address.phone_number = 'aaaaaaaaaaa'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが全角だと保存できないこと' do
      @purchase_address.phone_number = '０１２３４５６７８９０１'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが英数混同だと保存できないこと' do
      @purchase_address.phone_number = '012345abcde'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'userが紐付いていないと保存できないこと' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it 'productが紐付いていないと保存できないこと' do
      @purchase_address.product_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Product can't be blank")
    end
  end
end
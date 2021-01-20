require 'rails_helper'

RSpec.describe User, type: :model do
    before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do

      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "nameが全角文字であれば登録できる" do
        @user.name = 'がんばれ'
        expect(@user).to be_valid
      end

      it "passwordが英数混合であれば登録できる" do
        @user.password = '111aaa'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = '111aaa1'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end

      it "phone_numberがハイフンを含まなければ登録できる" do
        @user.phone_number = '09012341234'
        expect(@user).to be_valid
      end

      it "phone_numberが10桁もしくは11桁の場合登録できる" do
        @user.phone_number = '0901234123'
        expect(@user).to be_valid
      end

      it "occupation_idが2以上6以下の場合は登録できる" do
        @user.occupation_id = '3'
        expect(@user).to be_valid
      end

      it "position_idが2以上6以下の場合は登録できる" do
        @user.position_id = '3'
        expect(@user).to be_valid
      end

    end

    context '新規登録できないとき' do

      it "nameが空欄の場合登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "nameが全角でない場合登録できない" do
        @user.name = 'kasugai'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name 全角文字を使用してください")
      end

      it "passwordが英数混合ではない場合登録できない" do
        @user.password = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが6文字未満の場合登録できない" do
        @user.password = '1test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "phone_numberがハイフンを含む場合登録できない" do
        @user.phone_number = '080-1212-1212'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが10桁もしくは11桁ではない場合登録できない" do
        @user.phone_number = '0801212'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid")
      end

      it "occupation_idが1の場合登録できない" do
        @user.occupation_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Occupation must be other than 1")
      end

      it "position_idが1の場合登録できない" do
        @user.position_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Position must be other than 1")
      end
      
    end
  end
end

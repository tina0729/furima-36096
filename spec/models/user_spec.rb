require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
      before do
        @user = FactoryBot.build(:user)
      end

    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it "emailに＠が含まれていないと登録できない" do
      @user.email = 'example.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end  


    it "passwordが空では登録できないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end


    it "passwordは6文字以上でないと登録できないこと" do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end  

    it "passwordは半角英数字混合でないと登録できないこと" do
      @user.password = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end  

    it "passwordとpassword（確認）の値が一致しないと登録できないこと" do
      @user.password = '111aaa'
      @user.password_confirmation = '222bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "first_nameが空は登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "birthが空では登録できないこと" do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

    it "first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できないこと" do
      @user.first_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end  

    it "last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できないこと" do
      @user.last_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end  

    it "first_name_kanaは全角カタカナでないと登録できないこと" do
      @user.first_name_kana = 'a山田たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end  

    it "last_name_kanaは全角カタカナでないと登録できないこと" do
      @user.last_name_kana = 'a山田たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end  

  end  
end

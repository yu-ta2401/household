require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "firstname,lastname,firstname_kana,lastname_kana,nickname,
        birthday,email,passwordが存在すれば登録できること" do
          expect(@user).to be_valid
        end
       it "passwordが６文字以上の半角英数字であれば登録できること" do
          @user.password = "000abc"
          @user.password_confirmation = "000abc"
         expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "firstnameが空では登録できないこと" do
          @user.firstname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname can't be blank", "Firstname is invalid")
        end
        it "lastnameが空では登録できないこと" do
          @user.lastname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname can't be blank", "Lastname is invalid")
        end
        it "firstname_kanaが空では登録できないこと" do
          @user.firstname_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname kana can't be blank", "Firstname kana is invalid")
        end
        it "lastname_kanaが空では登録できないこと" do
          @user.lastname_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname kana can't be blank", "Lastname kana is invalid")
        end
        it "nicknameが空では登録できないこと" do
          @user.nickname = nil
          @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "birthdayが空では登録できないこと" do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
        it "emailが空では登録できないこと" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailに@がなければ登録できないこと" do
          @user.email = "@"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "passwordが空では登録できないこと" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank", "Password 6文字以上の半角英数字", "Password confirmation doesn't match Password")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できないこ" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password 6文字以上の半角英数字")
        end
        it "重複したemailがある場合登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
      end
    end
  end
end
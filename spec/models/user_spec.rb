require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '保存ができる時' do
      it "nicknameとemail、password,last_nameとfirst_name,last_name_kanaとfirst_name_kana,birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できること" do
        @user.password = "riku0726"
        @user.password_confirmation = "riku0726"
        expect(@user).to be_valid
      end
    end
    context '保存ができない時' do
      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "同じメールアドレスは登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "@がない場合は登録できないこと" do
        @user.email = "a.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "riku0"
        @user.password_confirmation = "riku0"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "0726riku"
        @user.password_confirmation = "0726Riku"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "英語のみでは登録できないこと" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "数字のみでは登録できないこと" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "全角では登録できないこと" do
        @user.password = "ああああああ"
        @user.password_confirmation = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "last_nameが空では登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空では登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_name_kanaが空では登録できないこと" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_name_kanaが空では登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "last_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.last_name = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "first_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
        @user.first_name = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "first_name_kanaが全角カタカナ以外では登録できないこと" do
        @user.first_name_kana = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "last_name_kanaが全角カタカナ以外では登録できないこと" do
        @user.last_name_kana = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end



      it "birthdayが空では登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

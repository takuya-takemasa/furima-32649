require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    
    before do
      @user = FactoryBot.build(:user)
    end
    
      describe '新規ユーザー登録' do
        context '新規登録がうまくいくとき' do
          it '、email、password、password_confirmation、名前(全角)、名前(カナ)、生年月日が存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end
        
        it 'nicknameが空だと登録できない' do
           @user.nickname = ''
           @user.valid?
           expect(@user.errors.full_messages).to include("Nickname can't be blank")
         end
        
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        
        it 'emailに＠が含まれていないと登録できない' do
          @user.email = 'test.test'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        
        it 'passwordが5文字以下であれば登録できない' do
          @user.password = 'abc12'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        
         it 'passwordが6文字以上でも英字のみでは登録できない' do
           @user.password = 'abcdef'
           @user.valid?
           expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
         end
        
         it 'passwordが6文字以上でも数字のみでは登録できない' do
           @user.password = '123456'
           @user.valid?
           expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
         end
        
         it 'passwordが全角では登録できない' do
           @user.password = 'ａｂｃ１２３'
           @user.valid?
           expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
         end
        
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        
         it 'ユーザー本名は、名字(last_name)がなければ登録できない' do
           @user.last_name = ''
           @user.valid?
           expect(@user.errors.full_messages).to include("Last name can't be blank")
         end
        
         it 'ユーザー本名は、名前(fast_name)がなければ登録できない' do
           @user.fast_name = ''
           @user.valid?
           expect(@user.errors.full_messages).to include("Fast name 全角文字を使用してください")
         end
        
         it 'ユーザー本名(last_name)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
           @user.last_name = 'abc123'
           @user.valid?
           expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
         end
        
         it 'ユーザー本名(fast_name)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
           @user.fast_name = 'abc123'
           @user.valid?
           expect(@user.errors.full_messages).to include("Fast name 全角文字を使用してください")
         end
        
        it 'ユーザー本名(フリガナ)は、名字(last_name_kana)がなければ登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        
         it 'ユーザー本名(フリガナ)は、名前(fast_name_kana)がなければ登録できない' do
           @user.fast_name_kana = ''
           @user.valid?
           expect(@user.errors.full_messages).to include("Fast name kana can't be blank", "Fast name kana 全角カタカナを使用してください")
         end
        
         it 'ユーザー本名(last_name_kana)のフリガナは、全角（カタカナ）でないと登録できない' do
           @user.last_name_kana = 'ﾀﾅｶ'
           @user.valid?
           expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
         end
        
         it 'ユーザー本名(fast_name_kana)のフリガナは、全角（カタカナ）でないと登録できない' do
           @user.fast_name_kana = 'ﾀﾛｳ'
           @user.valid?
           expect(@user.errors.full_messages).to include("Fast name kana 全角カタカナを使用してください")
         end
        
        it '生年月日を入力しなければ登録できない' do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
      
      end
  end
end 
    
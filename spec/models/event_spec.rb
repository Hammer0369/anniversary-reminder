require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe 'イベント登録機能' do
    context 'イベント登録できるとき' do
      it '全項目を正しく入力できれば出品できる' do
        expect(@event).to be_valid
      end
      it 'anniversary_nameは空でも保存できる' do
        @event.anniversary_name = ''
        expect(@event).to be_valid
      end
    end
    context 'イベント登録できないとき' do
      it 'last_nameがないと登録できない' do
        @event.last_name = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角でなければ登録できない' do
        @event.last_name = 'abc'
        @event.valid?
        expect(@event.errors.full_messages).to include 'Last name is invalid. Input full-width characters'
      end
      it 'last_nameが英字のみでは登録できない' do
        @event.last_name = 'abc'
        @event.valid?
        expect(@event.errors.full_messages).to include 'Last name is invalid. Input full-width characters'
      end
      it 'first_nameがないと登録できない' do
        @event.first_name = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角でなければ登録できない' do
        @event.first_name = 'abc'
        @event.valid?
        expect(@event.errors.full_messages).to include 'First name is invalid. Input full-width characters'
      end
      it 'first_nameが英字のみでは登録できない' do
        @event.first_name = 'abc'
        @event.valid?
        expect(@event.errors.full_messages).to include 'First name is invalid. Input full-width characters'
      end
      it 'last_name_kanaがないと登録できない' do
        @event.last_name_kana = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角ひらがなでなければ登録できない' do
        @event.last_name_kana = 'アイウ'
        @event.valid?
        expect(@event.errors.full_messages).to include 'Last name kana is invalid. Input full-width hiragana characters'
      end
      it 'last_nameが英字のみでは登録できない' do
        @event.last_name_kana = 'abc'
        @event.valid?
        expect(@event.errors.full_messages).to include 'Last name kana is invalid. Input full-width hiragana characters'
      end
      it 'first_nameがないと登録できない' do
        @event.first_name_kana = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角ひらがなでなければ登録できない' do
        @event.first_name_kana = 'アイウ'
        @event.valid?
        expect(@event.errors.full_messages).to include 'First name kana is invalid. Input full-width hiragana characters'
      end
      it 'First_nameが英字のみでは登録できない' do
        @event.first_name_kana = 'abc'
        @event.valid?
        expect(@event.errors.full_messages).to include 'First name kana is invalid. Input full-width hiragana characters'
      end
      it 'gender_idがないと登録できない' do
        @event.gender_id = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Gender can't be blank")
      end
      it 'anniversary_dateがないと登録できない' do
        @event.anniversary_date = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Anniversary date can't be blank")
      end
      it 'category_idがないと出品できない' do
        @event.category_id = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end

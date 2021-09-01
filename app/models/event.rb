class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :category
  belongs_to :user

  with_options presence: true do
    validates :last_name, :first_name,
              format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/,
                        message: 'is invalid. Input full-width characters', allow_blank: true }
    validates :last_name_kana, :first_name_kana,
              format: { with: /\A[ぁ-んー－]+\z/,
                        message: 'is invalid. Input full-width hiragana characters', allow_blank: true }
    validates :gender_id, :anniversary_date, :category_id
  end

  validates :gender_id, :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
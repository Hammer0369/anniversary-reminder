class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender, :category, :user 

  with_options presence: true do
    validates :name, :gender_id, :anniversary_date, :category_id
  end

  validates :gender_id, :category_id, numericality: { other_than: 1 } 
end

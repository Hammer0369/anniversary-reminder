class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '誕生日' },
    { id: 3, name: '結婚記念' },
    { id: 4, name: '付き合い始めた日' },
    { id: 5, name: 'その他の記念日' }
  ]

  include ActiveHash::Associations
  has_many :events
  end
class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '誕生日' },
    { id: 3, name: '結婚記念日' },
    { id: 4, name: '交際開始日' },
    { id: 5, name: 'その他の記念日' }
  ]

  include ActiveHash::Associations
  has_many :events
end

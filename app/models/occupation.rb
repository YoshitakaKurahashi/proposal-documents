class Occupation < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '法人営業部 第1チーム' },
    { id: 3, name: '法人営業部 第2チーム' },
    { id: 4, name: '法人営業部 第3チーム' },
    { id: 5, name: '法人営業部 第4チーム' },
  ]
  include ActiveHash::Associations
  has_many :users
end
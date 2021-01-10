class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'マネージャー' },
    { id: 3, name: 'チーフ' },
    { id: 4, name: 'リーダー' },
    { id: 5, name: 'スタッフ' },
    { id: 6, name: '担当' },
  ]
  include ActiveHash::Associations
  has_many :users
end
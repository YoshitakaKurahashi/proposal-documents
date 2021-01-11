class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :occupation
    belongs_to :position

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
  validates :email, uniqueness: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :occupation_id, :position_id, numericality: { other_than: 1 }
end

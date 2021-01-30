class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :occupation_id, :position_id, numericality: { other_than: 1 }

  has_many :user_proposals
  has_many :proposals, through: :user_proposals
  has_many :comments
  has_many :likes

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :occupation
  belongs_to :position

  def liked_by?(proposal_id)
    likes.where(proposal_id: proposal_id).exists?
  end
end

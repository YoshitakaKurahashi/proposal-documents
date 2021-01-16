class Proposal < ApplicationRecord
  has_many :user_proposals, dependent: :destroy
  has_many :users, through: :user_proposals
  has_many :comments
  # has_one_attached :image
end

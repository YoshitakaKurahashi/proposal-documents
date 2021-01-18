class Proposal < ApplicationRecord
  has_many :user_proposals
  has_many :users, through: :user_proposals
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_one_attached :image
end

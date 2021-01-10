class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :occupation
  belongs_to :position
  validates :name, :phone_number, presence: true
  validates :occupation_id, :position_id, numericality: { other_than: 1 }
end

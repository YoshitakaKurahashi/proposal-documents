class Proposal < ApplicationRecord
  has_many :user_proposals
  has_many :users, through: :user_proposals
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  with_options presence: true do
    validates :title,       length: { maximum: 20 }  
    validates :detail,      length: { maximum: 250 }  
    validates :term_start
    validates :term_end
    validates :target_group 
    validates :numeric
    validates :budget,      numericality: { only_integer: true }
    validates :payment
  end

end

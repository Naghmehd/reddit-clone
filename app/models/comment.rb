class Comment < ApplicationRecord
  validates :description, presence: true

  belongs_to :user, required: true
  belongs_to :post

  has_many :votes, as: :voteable
end

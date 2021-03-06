class Post < ApplicationRecord
  # ensure that title is present and at least 3 characters long
 validates :title, length: { minimum: 3 }, presence: true

 belongs_to :user, required: true

 has_many :comments, dependent: :destroy
 has_many :votes, as: :voteable

 def vote_sum
   votes.map(&:value).sum
 end

end

class Post < ApplicationRecord
  # ensure that title is present and at least 3 characters long
 validates :title, length: { minimum: 3 }, presence: true

 belong_to :users
 has_many :comments, dependent: :destroy
end

class User < ApplicationRecord

  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy


  validates :email, uniqueness: true,
    format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password, length: { in: 6..20 }

end

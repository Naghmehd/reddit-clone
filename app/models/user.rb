class User < ApplicationRecord

  has_secure_password


  validates :email, uniqueness: true, on: :create, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password, length: { in: 6..20 }

end

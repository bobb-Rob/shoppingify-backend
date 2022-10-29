class User < ApplicationRecord
  has_many  :shopping_lists, dependent: :destroy
  has_many  :items, dependent: :destroy
  
  devise :database_authenticatable, :jwt_authenticatable, :registerable,
  jwt_revocation_strategy: JwtDenylist

  validates :username, uniqueness: { case_sensitive: false }, presence: true, 
  allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 }
end

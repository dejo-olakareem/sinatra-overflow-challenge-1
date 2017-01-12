class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  validates :username, :email, presence: true, uniqueness: true
  validates :password_hash, presence: true
end

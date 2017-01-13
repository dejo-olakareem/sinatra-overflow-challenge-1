class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  validates :username, :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

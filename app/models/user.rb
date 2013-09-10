class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :email, :password_digest, presence: true

  has_many :posts
  has_many :comments

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil 
  end
  
end

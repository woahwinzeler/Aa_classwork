class User < ApplicationRecord
  #SPIRE  
  attr_accessor :password

  before_validation :ensure_session_token

  validates :session_token, uniqueness: true
  validates :email, presence: true, uniqueness: true 
  validates :password, length: {minimum: 6}, allow_nil: true 

  def self.find_by_credentials(username, password)
    user = User.find_by(email: username)
    if user && user.is_valid_password?(password)
      return user
    else
      nil 
    end 
  end 

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_valid_password?(password)
    password_object = BCrypt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end 

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end


end

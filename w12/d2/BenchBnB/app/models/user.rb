class User < ApplicationRecord
  attr_reader :password 

  after_initialize :ensure_session_token

  validates :username, :password_digest, :session_token, presence: true 
  validates :password, length: {minimum: 6}, allow_nil: true 
  validates :username, :session_token, uniqueness: true 

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_valid_password?(password)
      user 
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

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

end

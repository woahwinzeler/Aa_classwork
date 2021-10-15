class User < ApplicationRecord
  attr_reader :password
  after_validation :ensure_session_token

  # BCrypt::Password.new(self.password_digest).is_password?(password)
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end 
end

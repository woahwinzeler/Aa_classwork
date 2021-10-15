class User < ApplicationRecord
  attr_reader :password

  after_validation :ensure_session_token

  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniquness: true
  validates :password, length: {mimimum: 6}, allow_nil: true

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_valid_password?(password)
      user
    else
      nil
    end
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    password_digest = BCrypt::Password.create(password)
  end

  def is_valid_password?(password)
    pw_object = BCrtypt::Password.new(self.password_digest)
    pw_object.is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

end

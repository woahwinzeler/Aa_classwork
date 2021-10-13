class User < ApplicationRecord
  attr_reader :password

  # BCrypt::Password.new(self.password_digest).is_password?(password)
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end

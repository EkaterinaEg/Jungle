
class User < ApplicationRecord
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    puts user.inspect
    if user
      user.authenticate(password)
    else
      nil
    end
  end
end


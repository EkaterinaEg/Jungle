
class User < ApplicationRecord
  has_secure_password

<<<<<<< HEAD
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }, on: :create
  validates :password_confirmation, presence: true, length: { minimum: 5 }, on: :create


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
=======
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    puts user.inspect
>>>>>>> master
    if user
      user.authenticate(password)
    else
      nil
    end
  end
<<<<<<< HEAD


=======
>>>>>>> master
end




# class User < ActiveRecord::Base

#   has_secure_password

# end
class User < ApplicationRecord
  has_secure_password
end


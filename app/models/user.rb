require "bcrypt"

class User < ApplicationRecord
  include BCrypt
end

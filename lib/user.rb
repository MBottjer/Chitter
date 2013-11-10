require 'bcrypt'

class User

include DataMapper::Resource

attr_accessor :password_confirmation
attr_reader :password

  property :id, Serial 
  property :email, String, :unique => true 
  property :password_digest, Text
  property :name, String
  property :user_name, String, :unique => true

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else 
      nil
    end
  end

  validates_confirmation_of :password 
  validates_uniqueness_of :email, :user_name
end
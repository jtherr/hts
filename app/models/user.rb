class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of     :email
  validates_uniqueness_of   :email, :case_sensitive => false

  attr_accessible :email, :password, :password_confirmation
end

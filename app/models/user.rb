class User < ActiveRecord::Base
  has_many :phones
  #this says that all user names created have to be unique and different
  validates :name, uniqueness: true

  #this means that there must be a user name and password to create a user 
  validates :name, presence: true
  validates :password, presence: true
end

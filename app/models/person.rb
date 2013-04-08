class Person < ActiveRecord::Base
  attr_accessible :email, :password, :type, :username
end

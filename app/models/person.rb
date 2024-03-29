class Person < ActiveRecord::Base
  attr_accessible :email, :password, :person_type, :username
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true
  has_many :places, :dependent => :delete_all, :foreign_key => 'person_id'
  validates :email, :presence => true, :format => {:with => 
  		/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ , :message => "Enter a valid one"}, :if => "!person_type?"
end
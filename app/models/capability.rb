class Capability < ActiveRecord::Base
  attr_accessible :cap_name
  validates :cap_name, :uniqueness => true
  validates :cap_name, :presence => true
  has_and_belongs_to_many :places
end

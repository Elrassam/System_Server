class Capability < ActiveRecord::Base
  attr_accessible :cap_name
  validates :cap_name, :uniqueness => true
  has_many :places, :through => :place_has_caps, :dependent => :delete_all, , :foreign_key => 'place_id'
end
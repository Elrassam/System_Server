class CapabilitiesPlace < ActiveRecord::Base
  attr_accessible :capability_id, :place_id
  belongs_to :capabilities, :foreign_key => :capability_id
  belongs_to :places, :foreign_key => :place_id
  validates_uniqueness_of :capability_id, :scope => :place_id
  validate :check_place_exist
  validate :check_capability_exist
  validates :capability_id, :presence => true
  validates :place_id, :presence => true
  
  def check_place_exist
  	result = Place.exists?(["id = ? ", self.place_id])
  	if !result
  	  errors.add(:place_id, "Place must exist")
  	end
    return result
  end
  
  def check_capability_exist
  	result = Capability.exists?(["id = ? ", self.capability_id])
  	if !result
  	  errors.add(:capability_id, "Capability must exist")
  	end
    return result
  end
end

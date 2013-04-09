class Place < ActiveRecord::Base
  attr_accessible :person_id, :building, :p_name, :size
  belongs_to :person, :foreign_key => 'person_id'
  validates_uniqueness_of :p_name, :scope => :building
  validates :size, :presence => true
  validates :person_id, :presence => true
  has_many :capabilities, :through => :place_has_cap, :dependent => :delete_all, :foreign_key => 'capability_id'
  has_many :reservations
  validate :person_id_exists
  
  def person_id_exists
  	result = Person.exists?(["id = ? ", self.person_id])
  	if result
  	  result = !id_prsn.person_type
  	end
  	if !result
  	  errors.add(:person_id, "Admin must exist")
  	end
    return result
  end
end
class Place < ActiveRecord::Base
  attr_accessible :person_id, :building, :placename, :size
  belongs_to :person, :foreign_key => 'person_id'
  validates_uniqueness_of :placename, :scope => :building
  validates :size, :presence => true
  validates :building, :presence => true
  validates :placename, :presence => true
  validates :person_id, :presence => true
  has_and_belongs_to_many :capabilities
  has_many :reservations, :foreign_key => :place_id, :dependent => :delete_all
  validate :person_id_exists
  
  def person_id_exists
  	result = Person.exists?(["id = ? ", self.person_id])
  	if result
  	  result = !Person.find(self.person_id).person_type
  	end
  	if !result
  	  errors.add(:person_id, "Admin must exist")
  	end
    return result
  end
end

class Reservation < ActiveRecord::Base
  attr_accessible :datefrom, :period, :place_id, :purpose, :dateto
  belongs_to :place, :dependent => :delete, :foreign_key => :place_id
  validates_uniqueness_of :place_id, :scope => [:datefrom, :dateto, :period]
  validates :period, :inclusion => { :in => 1..9 }
  validate :check_from_to
  validates :datefrom, :presence => true
  validates :dateto, :presence => true
  validates :period, :presence => true, :numericality => {:only_integer => true}
  validates :place_id, :presence => true
  validates :purpose, :presence => true
  validate :check_place_exist
  
  def check_from_to
    result = true
  	if self.datefrom > self.dateto
  	  errors.add(:datefrom, "From date must be before To date")
  	  result = false
  	end
  	if result
  	  check = Reservation.where("place_id = ? AND period = ? AND (
  	  (datefrom <= ? AND dateto >= ?) OR 
  	  (datefrom <= ? AND dateto >= ?) OR 
  	  (datefrom >= ? AND dateto <= ?))",
  	  self.place_id, self.period, self.datefrom, self.datefrom, self.dateto,
  	  self.dateto, self.datefrom, self.dateto)

  	  if check.count > 0
  	  	errors.add(:datefrom, "This date reserved")
  	    result = false
  	  end
  	end
    result
  end
  
  def check_place_exist
  	result = Place.exists?(["id = ? ", self.place_id])
  	if !result
  	  errors.add(:place_id, "Place must exist")
  	end
    return result
  end
end

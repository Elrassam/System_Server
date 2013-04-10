class Reservation < ActiveRecord::Base
  attr_accessible :datefrom, :period, :place_id, :purpose, :dateto, :dayname
  belongs_to :place, :dependent => :delete, :foreign_key => :place_id
  validates_uniqueness_of :place_id, :scope => [:datefrom, :dateto, :period, :dayname]
  validates :period, :inclusion => { :in => 1..9 }
  validate :check_from_to
  validates :datefrom, :presence => true
  validates :dateto, :presence => true
  validates :dayname, :presence => true
  validates :period, :presence => true, :numericality => {:only_integer => true}
  validates :place_id, :presence => true
  validates :purpose, :presence => true
  validate :check_place_exist
  
  def check_from_to
    result = false
    
    if self.datefrom <= self.dateto
    	if (self.dayname == "Saturday" && (self.dayfrom..self.dayto).any?(&:saturday?)) ||
    		(self.dayname == "Sunday" && (self.dayfrom..self.dayto).any?(&:sunday?)) ||
    		(self.dayname == "Monday" && (self.dayfrom..self.dayto).any?(&:monday?)) ||
			(self.dayname == "Tuesday" && (self.dayfrom..self.dayto).any?(&:tuesday?)) ||
			(self.dayname == "Wednesday" && (self.dayfrom..self.dayto).any?(&:wednesday?))||
			(self.dayname == "Thursday" && (self.dayfrom..self.dayto).any?(&:thursday?)) ||
			(self.dayname == "Friday" && (self.dayfrom..self.dayto).any?(&:friday?))
    		result = true
    	end
    end
  	if result
  	  check = Reservation.where("place_id = ? AND dayname = ? AND period = ? AND (
  	  (datefrom <= ? AND dateto >= ?) OR 
  	  (datefrom <= ? AND dateto >= ?) OR 
  	  (datefrom >= ? AND dateto <= ?))",
  	  self.place_id, self.dayname, self.period, self.datefrom, self.datefrom, self.dateto,
  	  self.dateto, self.datefrom, self.dateto)

  	  if check.count > 0
  	  	errors.add(:dayname, "This day is reserved withen these dates.")
  	    result = false
  	  end
  	end
    result
  end
  
  def check_place_exist
  	result = Place.exists?(["id = ? ", self.place_id])
  	if !result
  	  errors.add(:place_id, " must exist")
  	end
    return result
  end
end

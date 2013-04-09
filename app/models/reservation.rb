class Reservation < ActiveRecord::Base
  attr_accessible :from, :period, :place_id, :purpose, :to
  belongs_to :place, :dependent => :delete, :foreign_key => :place_id
  validates_uniqueness_of :place_id, :scope => [:from, :to, :period]
  validates :period, :inclusion => { :in => 1..9 }
  validate :check_from_to
  validates :from, :presence => true
  validates :to, :presence => true
  validates :period, :presence => true, :numericality => {:only_integer => true}
  validates :place_id, :presence => true
  validates :purpose, :presence => true
  
  def check_from_to
    result = true
  	if self.from > self.to
  	  errors.add("From date must be before To date")
  	  result = false
  	end
  	if result
  	  
  	end
    result
  end
end

class Reservation < ActiveRecord::Base
  attr_accessible :from, :period, :place_id, :purpose, :to
  belongs_to :place, :dependent => :delete
  validates_uniqueness_of :place_id, :scope => [:from, :to, :period]
  validates :period, :inclusion => { :in => 1..8 }
  validate :check_from_to
  
  
  def check_from_to
  	errors.add("From date must be before To date") unless self.from <= self.to
    (self.from <= self.to)?
  end
end

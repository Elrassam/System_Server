class PlaceHasCap < ActiveRecord::Base
  attr_accessible :capability_id, :place_id
  belongs_to :capabilities 
  belongs_to :places
end

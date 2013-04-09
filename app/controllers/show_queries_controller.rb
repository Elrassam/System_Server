class ShowQueriesController < ApplicationController
  def check_place_status
  	respond_to do |format|
      format.html { render "check_place_status" }
    end
  end
  
  def check_place_status_action
  	place_name = params[:place_name_status]
  	building_name = params[:building_name_status]
  	@status_mssg = []
  	place = Place.find_by_placename_and_building(place_name, building_name)
  	if place != nil
  		place_id = place.id
  		place_status = Reservation.where("place_id = ?", place_id)
  		if place_status.count > 0
  			@status_mssg << "#{place_status.first.from}, #{place_status.first.to}, 
  			#{place_status.first.period}, #{place_status.first.purpose}"      
  		else
  			@status_mssg << "No information stored about this place."
  		end
  	else
  		@status_mssg << "Unkown place"	
  	end
  	respond_to do |format|
	  format.html { render "check_place_status"}
	  format.json { render json: @status_mssg }
	end	  	
  end

  def search_specific_place
  	respond_to do |format|
      format.html { render "search_specific_place" }
    end  
  end
  
  def search_specific_place_action
  	size = params[:size]
  	capabilities = params[:capabilities].join(',')
  	##########
  end

  def check_place_empty
  	respond_to do |format|
      format.html { render "check_place_empty" }
    end
  end
  
  def check_place_empty_action
  	place_name = params[:place_name]
  	building_name = params[:building_name]
  	event = params[:day_date]
  	day_date = Date.new event["date(1i)"].to_i, event["date(2i)"].to_i, event["date(3i)"].to_i
  	period = params[:period]
  	
  	place = Place.find_by_placename_and_building(place_name, building_name)
  	place_empty = true
  	@place_mssg = []
  	place_purpose = ""
  	if place != nil
  		place_id = place.id
  		place_status = Reservation.where("period = ? AND place_id = ? AND from <= ? AND to >= ?", period, place_id, day_date, day_date)
  		if place_status.count > 0
  			place_purpose = place_status.first.purpose
  			place_empty = false
  		end
  		@place_mssg << place_empty << place_purpose
  	else
  		@place_mssg << "Unkown place"
  	end
  	respond_to do |format|
	  format.html { render "check_place_empty"}
	  format.json { render json: @place_mssg }
	end	
  end
end

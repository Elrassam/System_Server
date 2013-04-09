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
  			for i in 0..place_status.count-1
  				@status_mssg << place_status[i].datefrom
  				@status_mssg << place_status[i].dateto
  				@status_mssg << place_status[i].period
  				@status_mssg << place_status[i].purpose 
  			end     
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
  	event = params[:empty_day_date]
  	empty_day_date = Date.new event["date(1i)"].to_i, event["date(2i)"].to_i, 
  											event["date(3i)"].to_i
  	empty_period = params[:empty_period]
  	@empty_places_mssg = []
  	places = Place.joins(:reservations).where("places.size >= ? AND reservations.period = ? 
		AND ((reservations.datefrom > ? AND reservations.dateto > ?) OR
			 (reservations.datefrom < ? AND reservations.dateto < ?))",
		size, empty_period, empty_day_date, empty_day_date, empty_day_date, empty_day_date)
  	if places.first!=nil
  		for i in 0..places.count-1
			@empty_places_mssg << places[i].placename
			@empty_places_mssg << places[i].building
		end
	else
		@empty_places_mssg << "There isn't any empty place"	
  	end
  	respond_to do |format|
	  format.html { render "search_specific_place"}
	  format.json { render json: @empty_places_mssg }
	end
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
  	day_date = Date.new event["date(1i)"].to_i, event["date(2i)"].to_i, 
  											event["date(3i)"].to_i
  	period = params[:period]
  	
  	place = Place.find_by_placename_and_building(place_name, building_name)
  	place_empty = true
  	@place_mssg = []
  	place_purpose = ""
  	if place != nil
  		place_id = place.id
  		place_status = Reservation.where("period = ? AND place_id = ? AND datefrom <= ? 
  					AND dateto >= ?", period, place_id, day_date, day_date)
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

class ReservationsController < ApplicationController
  # GET /reservations
  # GET /reservations.json
  def index
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@reservations = Reservation.all

			respond_to do |format|
			  format.html # index.html.erb
			  format.json { render json: @reservations }
			end
		  else
		  	render "public/500.html"  
		  end
		#else
		#	render "app/views/login/login.html.erb"
		#end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@reservation = Reservation.find(params[:id])

			respond_to do |format|
			  format.html # show.html.erb
			  format.json { render json: @reservation }
			end
		  else
		  	render "public/500.html"  
		  end
		#else
		#	render "app/views/login/login.html.erb"
		#end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # GET /reservations/new
  # GET /reservations/new.json
  def new
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@reservation = Reservation.new

			respond_to do |format|
			  format.html # new.html.erb
			  format.json { render json: @reservation }
			end
		  else
		  	render "public/500.html"  
		  end
		#else
		#	render "app/views/login/login.html.erb"
		#end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # GET /reservations/1/edit
  def edit
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  if session[:usertype_cookie_system] == "false"
		  	@reservation = Reservation.find(params[:id])
		  else
		  	render "public/500.html"  
		  end
		#else
		#	render "app/views/login/login.html.erb"
		#end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # POST /reservations
  # POST /reservations.json
  def create
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  @reservation_error_mssg = nil
		  if session[:usertype_cookie_system] == "false"
		    place = Place.find_by_placename(params[:reservation][:place_id])
		  	@reservation = Reservation.new
		  	if place !=nil
				date_from = Date.new params[:reservation]["datefrom(1i)"].to_i, params[:reservation]["datefrom(2i)"].to_i, 
															params[:reservation]["datefrom(3i)"].to_i
	
				date_to = Date.new params[:reservation]["dateto(1i)"].to_i, params[:reservation]["dateto(2i)"].to_i, 
				 											params[:reservation]["dateto(3i)"].to_i  											
				
		  		@reservation = Reservation.new(:place_id => place.id,:datefrom=>date_from,:dateto=>date_to,
		  				:dayname=>params[:reservation][:dayname],:period=>params[:reservation][:period],:purpose=>params[:reservation][:purpose])
				respond_to do |format|
				  if @reservation.save
					format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
					format.json { render json: @reservation, status: :created, location: @reservation }
				  else
					format.html { render action: "new" }
					format.json { render json: @reservation.errors, status: :unprocessable_entity }
				  end
				end
		  	else
		  		@reservation_error_mssg = []
		  		@reservation_error_mssg << "Can't find this place."
		  		render action: "new"
		  	end
		  else
		  	render "public/500.html"  
		  end
		#else
		#	render "app/views/login/login.html.erb"
		#end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  @reservation_error_mssg = nil
		  if session[:usertype_cookie_system] == "false"
			@reservation = Reservation.find(params[:id])
			place = Place.find_by_placename(params[:reservation][:place_id])
		  	if place !=nil
		  		date_from = Date.new params[:reservation]["datefrom(1i)"].to_i, params[:reservation]["datefrom(2i)"].to_i, 
															params[:reservation]["datefrom(3i)"].to_i
	
				date_to = Date.new params[:reservation]["dateto(1i)"].to_i, params[:reservation]["dateto(2i)"].to_i, 
				 											params[:reservation]["dateto(3i)"].to_i  											
			
		  		bool = @reservation.update_attributes(:place_id => place.id,:datefrom=>date_from,:dateto=>date_to,
		  				:dayname=>params[:reservation][:dayname],:period=>params[:reservation][:period],:purpose=>params[:reservation][:purpose])
				respond_to do |format|
				  if bool
					format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
					format.json { head :no_content }
				  else
					format.html { render action: "edit" }
					format.json { render json: @reservation.errors, status: :unprocessable_entity }
				  end
				end
		  	else
		  		@reservation_error_mssg = []
		  		@reservation_error_mssg << "Can't find this place."
		  		render action: "edit"
		  	end
		  else
		  	render "public/500.html"  
		  end
		#else
		#	render "app/views/login/login.html.erb"
		#end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@reservation = Reservation.find(params[:id])
			@reservation.destroy

			respond_to do |format|
			  format.html { redirect_to reservations_url }
			  format.json { head :no_content }
			end
		  else
		  	render "public/500.html"  
		  end
		#else
		#	render "app/views/login/login.html.erb"
		#end
	else
	  render "app/views/login/login.html.erb"
	end
  end
end

class CapabilitiesPlacesController < ApplicationController
  # GET /capabilities_places
  # GET /capabilities_places.json
  def index
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
	  #prsn = Person.find_by_username(session[:username_cookie_system])
	  #if prsn != nil
		  if session[:usertype_cookie_system] == "false"
		  	    
		  	@capabilities_places = CapabilitiesPlace.all

			respond_to do |format|
			  format.html # index.html.erb
			  format.json { render json: @capabilities_places }
			end
		  else
		  	render "public/500.html"  
		  end
	  #else
		#render "app/views/login/login.html.erb"
	  #end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # GET /capabilities_places/1
  # GET /capabilities_places/1.json
  def show
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
      #prsn = Person.find_by_username(session[:username_cookie_system])
	  #if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@capabilities_place = CapabilitiesPlace.find(params[:id])

			respond_to do |format|
			  format.html # show.html.erb
			  format.json { render json: @capabilities_place }
			end
		  else
		  	render "public/500.html"  
		  end
	  #else
		#render "app/views/login/login.html.erb"
	  #end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # GET /capabilities_places/new
  # GET /capabilities_places/new.json
  def new
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
      #prsn = Person.find_by_username(session[:username_cookie_system])
	  #if prsn != nil
	 	  if session[:usertype_cookie_system] == "false"
			@capabilities_place = CapabilitiesPlace.new

			respond_to do |format|
			  format.html # new.html.erb
			  format.json { render json: @capabilities_place }
			end	
		  else
		  	render "public/500.html"  
		  end
	  #else
		#render "app/views/login/login.html.erb"
	  #end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # GET /capabilities_places/1/edit
  def edit
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
      #prsn = Person.find_by_username(session[:username_cookie_system])
	  #if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@capabilities_place = CapabilitiesPlace.find(params[:id])
		  else
		  	render "public/500.html"  
		  end
	  #else
		#render "app/views/login/login.html.erb"
	  #end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # POST /capabilities_places
  # POST /capabilities_places.json
  def create
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
      #prsn = Person.find_by_username(session[:username_cookie_system])
	  #if prsn != nil
	  	  @cap_place_error_mssg = nil
		  if session[:usertype_cookie_system] == "false"
		  	capability = Capability.find_by_cap_name(params[:capabilities_place][:capability_id])
		  	place = Place.find_by_placename(params[:capabilities_place][:place_id])
		  	@capabilities_place = CapabilitiesPlace.new
		  	if capability != nil and place !=nil
		  		@capabilities_place = CapabilitiesPlace.new(:place_id =>place.id, :capability_id => capability.id)
				respond_to do |format|
				  if @capabilities_place.save
					format.html { redirect_to @capabilities_place, notice: 'Capabilities place was successfully created.' }
					format.json { render json: @capabilities_place, status: :created, location: @capabilities_place }
				  else
					format.html { render action: "new" }
					format.json { render json: @capabilities_place.errors, status: :unprocessable_entity }
				  end
				end
			else
				@cap_place_error_mssg = []
		  		@cap_place_error_mssg << "Can't find this capability or this place."
		  		render action: "new"
		  	end
		  else
		  	render "public/500.html"  
		  end
	  #else
	  	#render "app/views/login/login.html.erb"
	  #end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # PUT /capabilities_places/1
  # PUT /capabilities_places/1.json
  def update
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
      #prsn = Person.find_by_username(session[:username_cookie_system])
	  #if prsn != nil
	      @cap_place_error_mssg = nil
		  if session[:usertype_cookie_system] == "false"
			@capabilities_place = CapabilitiesPlace.find(params[:id])
			capability = Capability.find_by_cap_name(params[:capabilities_place][:capability_id])
		  	place = Place.find_by_placename(params[:capabilities_place][:place_id])
		  	if capability != nil and place !=nil
		  		bool = @capabilities_place.update_attributes(:place_id =>place.id, :capability_id => capability.id)
		  		respond_to do |format|
			  	
				  if bool
					format.html { redirect_to @capabilities_place, notice: 'Capabilities place was successfully updated.' }
					format.json { head :no_content }
				  else
					format.html { render action: "edit" }
					format.json { render json: @capabilities_place.errors, status: :unprocessable_entity }
				  end
				end
		  	else
		  		@cap_place_error_mssg = []
		  		@cap_place_error_mssg << "Can't find this capability or this place."
		  		render action: "edit"
		  	end
		  else
		  	render "public/500.html"  
		  end
	  #else
		#render "app/views/login/login.html.erb"
	  #end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # DELETE /capabilities_places/1
  # DELETE /capabilities_places/1.json
  def destroy
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
      #prsn = Person.find_by_username(session[:username_cookie_system])
	  #if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@capabilities_place = CapabilitiesPlace.find(params[:id])
			@capabilities_place.destroy

			respond_to do |format|
			  format.html { redirect_to capabilities_places_url }
			  format.json { head :no_content }
			end
		  else
		  	render "public/500.html"  
		  end
	  #else
	  	#render "app/views/login/login.html.erb"
	  #end
	else
	  render "app/views/login/login.html.erb"
	end
  end
end
class PlacesController < ApplicationController
  # GET /places
  # GET /places.json
  def index
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@places = Place.all

			respond_to do |format|
			  format.html # index.html.erb
			  format.json { render json: @places }
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

  # GET /places/1
  # GET /places/1.json
  def show
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
    	#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@place = Place.find(params[:id])

			respond_to do |format|
			  format.html # show.html.erb
			  format.json { render json: @place }
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

  # GET /places/new
  # GET /places/new.json
  def new
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@place = Place.new

			respond_to do |format|
			  format.html # new.html.erb
			  format.json { render json: @place }
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

  # GET /places/1/edit
  def edit
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
    	#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  if session[:usertype_cookie_system] == "false"
		  	@place = Place.find(params[:id])
		  else
		  	render "public/500.html"  
		  end
#		else
		#	render "app/views/login/login.html.erb"
		#end
	else
	  render "app/views/login/login.html.erb"
	end
  end

  # POST /places
  # POST /places.json
  def create
  	if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  @places_error_mssg = nil
		  
		  if session[:usertype_cookie_system] == "false"
		    @place = Place.new
		    prsn = Person.find_by_username(params[:place][:person_id])
		    if prsn != nil
		    	@place = Place.new(:placename=>params[:place][:placename],:building=>params[:place][:building],
		    									:size=>params[:place][:size],:person_id=>prsn.id)

				respond_to do |format|
				  if @place.save
					format.html { redirect_to @place, notice: 'Place was successfully created.' }
					format.json { render json: @place, status: :created, location: @place }
				  else
					format.html { render action: "new" }
					format.json { render json: @place.errors, status: :unprocessable_entity }
				  end
				end
		    else
		    	@places_error_mssg = []
		  		@places_error_mssg << "Can't find this person."
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

  # PUT /places/1
  # PUT /places/1.json
  def update
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
    	#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  @places_error_mssg = nil
		  if session[:usertype_cookie_system] == "false"
			@place = Place.find(params[:id])
			prsn = Person.find_by_username(params[:place][:person_id])
		    if prsn != nil
		    	bool = @place.update_attributes(:placename=>params[:place][:placename],
		    									:building=>params[:place][:building],
		    									:size=>params[:place][:size],:person_id=>prsn.id)
		    	respond_to do |format|
				  if bool
					format.html { redirect_to @place, notice: 'Place was successfully updated.' }
					format.json { head :no_content }
				  else
					format.html { render action: "edit" }
					format.json { render json: @place.errors, status: :unprocessable_entity }
				  end
				end 								
		    else
		    	@places_error_mssg = []
		  		@places_error_mssg << "Can't find this person."
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

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
    	#prsn = Person.find_by_username(session[:username_cookie_system])
		#if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@place = Place.find(params[:id])
			@place.destroy

			respond_to do |format|
			  format.html { redirect_to places_url }
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

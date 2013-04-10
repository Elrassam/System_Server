class CapabilitiesController < ApplicationController
  # GET /capabilities
  # GET /capabilities.json
  def index
  	if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
  	  prsn = Person.find_by_username(session[:username_cookie_system])
  	  if prsn != nil
	  	  if session[:usertype_cookie_system] == "false"
	  	  	@capabilities = Capability.all
			respond_to do |format|
			  format.html # index.html.erb
			  format.json { render json: @capabilities }
			end
	  	  else
	  	  	render "public/500.html"  
	  	  end
  	  else
  	  	render "app/views/login/login.html.erb"
  	  end
  	else
  	  render "app/views/login/login.html.erb"
  	end
  end

  # GET /capabilities/1
  # GET /capabilities/1.json
  def show
     if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
     prsn = Person.find_by_username(session[:username_cookie_system])
	  if prsn != nil
		  if session[:usertype_cookie_system] == "false"
			@capability = Capability.find(params[:id])

			respond_to do |format|
			  format.html # show.html.erb
			  format.json { render json: @capability }
			end
	  	  else
	  	  	render "public/500.html"  
	  	  end
	  else
	  	render "app/views/login/login.html.erb"
	  end
  	else
  	  render "app/views/login/login.html.erb"
  	end
  end

  # GET /capabilities/new
  # GET /capabilities/new.json
  def new
     if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
      prsn = Person.find_by_username(session[:username_cookie_system])
  	  if prsn != nil
	  	  if session[:usertype_cookie_system] == "false"
			@capability = Capability.new

			respond_to do |format|
			  format.html # new.html.erb
			  format.json { render json: @capability }
			end
	  	  else
	  	  	render "public/500.html"  
	  	  end
  	  else
  	  	render "app/views/login/login.html.erb"
  	  end
  	else
  	  render "app/views/login/login.html.erb"
  	end
  end

  # GET /capabilities/1/edit
  def edit
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
      prsn = Person.find_by_username(session[:username_cookie_system])
  	  if prsn != nil
	  	  if session[:usertype_cookie_system] == "false"
	  	  	@capability = Capability.find(params[:id])
	  	  else
	  	  	render "public/500.html"  
	  	  end
  	  else
  	  	render "app/views/login/login.html.erb"
  	  end
  	else
  	  render "app/views/login/login.html.erb"
  	end
  end

  # POST /capabilities
  # POST /capabilities.json
  def create
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
      prsn = Person.find_by_username(session[:username_cookie_system])
  	  if prsn != nil
	  	  if session[:usertype_cookie_system] == "false"
			@capability = Capability.new(params[:capability])

			respond_to do |format|
			  if @capability.save
				format.html { redirect_to @capability, notice: 'Capability was successfully created.' }
				format.json { render json: @capability, status: :created, location: @capability }
			  else
				format.html { render action: "new" }
				format.json { render json: @capability.errors, status: :unprocessable_entity }
			  end
			end
	  	  else
	  	  	render "public/500.html"  
	  	  end
  	  else
  	  	render "app/views/login/login.html.erb"
  	  end
  	else
  	  render "app/views/login/login.html.erb"
  	end
  end

  # PUT /capabilities/1
  # PUT /capabilities/1.json
  def update
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
      prsn = Person.find_by_username(session[:username_cookie_system])
  	  if prsn != nil
	  	  if session[:usertype_cookie_system] == "false"
			@capability = Capability.find(params[:id])

			respond_to do |format|
			  if @capability.update_attributes(params[:capability])
				format.html { redirect_to @capability, notice: 'Capability was successfully updated.' }
				format.json { head :no_content }
			  else
				format.html { render action: "edit" }
				format.json { render json: @capability.errors, status: :unprocessable_entity }
			  end
			end
	  	  else
	  	  	render "public/500.html"  
	  	  end
  	  else
  	  
  	  end
  	else
  	  render "app/views/login/login.html.erb"
  	end
  end

  # DELETE /capabilities/1
  # DELETE /capabilities/1.json
  def destroy
    if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
		prsn = Person.find_by_username(session[:username_cookie_system])
		if prsn != nil
			if session[:usertype_cookie_system] == "false"
				@capability = Capability.find(params[:id])
				@capability.destroy

				respond_to do |format|
				  format.html { redirect_to capabilities_url }
				  format.json { head :no_content }
				end
		  	else
		  	  	render "public/500.html"  
		  	end
		else
			render "app/views/login/login.html.erb"
		end
  	else
  	  render "app/views/login/login.html.erb"
  	end
  end
end

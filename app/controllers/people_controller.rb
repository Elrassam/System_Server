class PeopleController < ApplicationController
  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])
    respond_to do |format|
      if @person.save
      	session[:username_cookie_system] = @person.username
  		session[:usertype_cookie_system] = "#{@person.person_type}"
      	if @person.person_type == true
      	    format.html { render "public/show_queries" }
        	format.json { render json: @person}
      	else
      	    format.html { render "public/edit_queries" }
        	format.json { render json: @person}
      	end
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def index
  	render "public/500.html"
  end
  
  def show
  	render "public/500.html"
  end
  
  def edit
  	render "public/500.html"
  end
  
  def update
  	render "public/500.html"
  end
  
  def destroy
  	render "public/500.html"
  end
end

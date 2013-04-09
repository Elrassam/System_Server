class LoginController < ApplicationController
  def login
  end
  
  def login_action
    prsn = Person.find_by_username_and_password(params[:username], params[:password])
    @person_login = nil
  	@login_mssg = []
  	if prsn != nil
  	  @person_login = prsn
  	  @login_mssg << "Welcome"
  	else	
  	  @login_mssg << "Invalid username or password"
  	end
    respond_to do |format|
      format.html { render "public/show_queries.html"}
      format.json { render json: @person_login }
    end	
  end
end

class LoginController < ApplicationController
  def login
  
  	if session.has_key?(:username_cookie_system) && session.has_key?(:usertype_cookie_system)
  	  @person_login = nil
  	  prsn = Person.find_by_username(session[:username_cookie_system])
  	  if prsn != nil
  	  	  @person_login = prsn
  	  	  user_flag = session[:usertype_cookie_system]
	  	  if user_flag == "true"
	  	      respond_to do |format|
				  format.html { render "public/show_queries.html"}
				  format.json { render json: @person_login }
			  end	
	  	  else
	  	 	  respond_to do |format|
				  format.html { render "public/edit_queries.html"}
				  format.json { render json: @person_login }
			  end	
	  	  end
	  else
	  	  render "login"	  
	  end
  	else
  	  render "login"  
  	end
  end
  
  def login_action
  	prsn = Person.find_by_username_and_password(params[:username], params[:password])
    @person_login = nil
  	@login_mssg = nil
  	if prsn != nil
  	  @person_login = prsn
  	  user_flag = prsn.person_type
  	  session[:username_cookie_system] = @person_login.username
  	  session[:usertype_cookie_system] = "#{user_flag}"
  	  if user_flag
  	      respond_to do |format|
			  format.html { render "public/show_queries.html"}
			  format.json { render json: @person_login }
		  end	
  	  else
  	 	  respond_to do |format|
			  format.html { render "public/edit_queries.html"}
			  format.json { render json: @person_login }
		  end	
  	  end
  	  
  	else
  	  @login_mssg = []		
  	  @login_mssg << "Invalid username or password"
  	  respond_to do |format|
		  format.html { render "login"}
		  format.json { render json: @login_mssg }
	  end
  	end
  end
end








class UsersController < ApplicationController
	
	#before_filter :save_login_state, :only => [:new, :create]
	
	def new
  	
	end
  
	def create
    	@user = User.new(params[:user].permit(:username,:email,:password_confirmation,:password, :first_name, :last_name, :major, :year))
    	if @user.save
      		flash[:notice] = "You signed up successfully"
      		flash[:color]= "valid"
    	else
      		flash[:notice] = "Form is invalid"
      		flash[:color]= "invalid"
    	end
    	render "new"
  	end
end

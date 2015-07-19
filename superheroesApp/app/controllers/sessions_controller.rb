class SessionsController < ApplicationController
  def home
  end

  def signup
  	@user = User.new
  end

	def create
		@user = User.create(user_params)
		# binding.pry
		if @user.save
    	session[:user_id] = @user.id
    	redirect_to home_path, notice: "Successfully signed up!"
  	else
  		
    	redirect_to signup_path, alert: "Username taken"
    end
	end

 def login
 end
 
	def attempt_login
		if params[:username].present? && params[:password].present?
	    	found_user = User.where(username: params[:username]).first
	    	if found_user 
	     		authorized_user = found_user.authenticate(params[:password])
	     	end
	  	end
	 if !found_user
	     	flash.now[:alert] = "Invalid username"
	     	render :login
	 elsif !authorized_user
	     	flash.now[:alert] = "Invalid password"
	     	render :login
	 else 
	     			session[:user_id] = authorized_user.id
	     		 redirect_to home_path
	 end
	end


  def logout
		session[:user_id] = nil
		redirect_to login_path
  end


  private
  def user_params
  	params.require(:user).permit(:username, :password, :password_digest)
  end

end
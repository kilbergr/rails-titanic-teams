
class UsersController < ActionController::Base

	def ensure_correct_user
		user = User.find_by_id params[:id]
		unless user.id == session[:user_id]
			redirect_to root_path, alert: "You cannot alter other users' information"
		end
	end

end

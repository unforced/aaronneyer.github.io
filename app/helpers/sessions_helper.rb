module SessionsHelper

	def sign_in(user)
		cookies[:remember_token] = { value: user.remember_token, expires: 30.days.from_now.utc }
		User.current_user = User.find_by_remember_token(cookies[:remember_token])
	end

	def signed_in?
		!User.current_user.nil?
	end

	#def current_user=(user)
	#	@current_user = user
	#end

	#def current_user
	#	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	#end

	def signed_in_user
		redirect_to :back, notice: "Insufficient access" unless signed_in?
	end

	def correct_user
		redirect_to :back, notice: "Insufficient access" unless User.current_user == User.find(params[:id]) || User.current_user.is_admin?
	end

	def admin_user
		redirect_to :back, notice: "Insufficient access" unless User.current_user.is_admin?
	end

	def editor_user
		redirect_to :back, notice: "Insufficient access" unless User.current_user.is_editor?
	end
end

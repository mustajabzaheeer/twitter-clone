class UsernamesController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :redirect_to_username_form

	def new

	end

	def update
		if username_params[:username].present? && current_user.update(username_params)
			redirect_to dashboard_path
		else
			flash[:alert] = username_params[:username].blank? ? "Please enter the username" : current_user.errors.full_messages.join(', ') 
			redirect_to new_username_path
		end
	end

	private

	def username_params
		params.require(:user).permit(:username, :name, :avatar)
	end
end
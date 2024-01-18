class UsernamesController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :redirect_to_username_form

	def new

	end

	def update
		current_user.update(update_params)
		redirect_to dashboard_path
	end

	private

	def update_params
		params.require(:user).permit(:username)
	end
end
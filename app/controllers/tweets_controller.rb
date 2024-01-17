class TweetsController < ApplicationController
	before_action :authenticate_user!

	def create
		tweet = Tweet.new(tweet_params.merge(user: current_user))

		redirect_to root_path if tweet.save
	end
	private

	def tweet_params
		params.require(:tweet).permit(:body)		
	end
end
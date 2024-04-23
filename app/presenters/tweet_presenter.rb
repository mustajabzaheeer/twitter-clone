class TweetPresenter
	include ActionView::Helpers::DateHelper

	def initialize(tweet)
		@tweet = tweet
	end

	attr_reader :tweet

	delegate :user, :body, to: :tweet
	delegate :avatar, :username, :name, to: :user

	def created_at
		if tweet.created_at < 24.hours.ago
			tweet.created_at.strftime('%b %-d')
		else
			time_ago_in_words(tweet.created_at)
		end
	end
end
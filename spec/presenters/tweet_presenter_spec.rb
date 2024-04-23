require 'rails_helper'

RSpec.describe TweetPresenter, type: :presenter do
  describe "#created_at" do
    context "if day has passed" do
      before do
        travel_to Time.local(2024, 3, 3, 10, 5, 0)  
      end

      after do
        travel_back
      end
      it "diaplays shortened time in hours " do
        tweet = create(:tweet)
        tweet.update! created_at: 2.days.ago
        expect(TweetPresenter.new(tweet).created_at).to eq("Mar 1")
      end
    end

    context "if few hours passed" do
      before do
        travel_to Time.local(2024, 3, 3, 10, 5, 0)  
      end

      after do
        travel_back
      end
      it "diaplays shortened time in hours " do
        tweet = create(:tweet)
        tweet.update! created_at: 4.hours.ago
        expect(TweetPresenter.new(tweet).created_at).to eq("about 4 hours")
      end
    end
  end
end

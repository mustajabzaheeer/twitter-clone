require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "Post /create" do
    context "if user is signed in" do
      it "creates a post " do
        user = create(:user)
        sign_in user
        expect do 
          post tweets_path, params: { tweet: {body: "This is a tweet"} }
        end.to change { Tweet.count }.by(1)
        expect(response).to redirect_to(root_path)
      end
    end

    context "if user is not signed in" do
      it "is responds with redirect" do
        post tweets_path, params: { body: "unsuccessful tweet" }
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end

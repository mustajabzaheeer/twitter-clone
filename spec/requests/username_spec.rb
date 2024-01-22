require 'rails_helper'

RSpec.describe "Usernames", type: :request do
  let(:user) { create(:user, username: nil) }
  before { sign_in user }

  describe "Get /new" do
    it "is successful" do
      get new_username_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "Put /update" do
    context "valid params" do
      it "updates user" do
        put username_path(user), params: { user:{ username: "username" } }
        expect(user.reload.username).to eq("username")
        expect(response).to redirect_to(dashboard_path)
      end
    end

    context "valid params" do
      it "redirect to" do
        put username_path(user), params: { user:{ username: "" } }
        expect(response).to redirect_to(new_username_path) 
      end
    end

  end
end

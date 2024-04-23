require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tweets).dependent(:destroy) }
  it { should validate_uniqueness_of(:username).case_insensitive.allow_blank }

  describe "set_name" do
    context "When name is set" do
      it "does not change the name" do
        user = build(:user, username: "moon", name: "moon")
        user.save
        expect(user.reload.name).to eq("moon")
      end
    end

    context "When name is not set" do
      it "humaizes the name" do
        user = build(:user, username: "yo_boymoon")
        user.save
        expect(user.reload.name).to eq("Yo boymoon")
      end
    end
  end
end

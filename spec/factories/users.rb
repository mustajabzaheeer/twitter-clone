FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "dev#{n}@admin.com"}
    password { "password" }  
    username { Faker::Internet.username }  
  end
end

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "dev#{n}@admin.com"}
    password { "password" }    
  end
end

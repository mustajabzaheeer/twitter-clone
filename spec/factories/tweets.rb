FactoryBot.define do
  factory :tweet do
    user { association(:user) }
    body { "MyString" }
  end
end

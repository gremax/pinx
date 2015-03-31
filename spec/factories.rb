FactoryGirl.define do
  factory :user do
    username  "John"
    email     "john@example.com"
    password   "password"
    password_confirmation "password"
  end
end
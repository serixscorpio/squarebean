FactoryGirl.define do
  factory :admin, class: User do
    email "admin@squarebean.com"
    password "password"
    password_confirmation "password"
  end
end

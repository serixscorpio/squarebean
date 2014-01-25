FactoryGirl.define do
  factory :admin, class: User do
    email ENV["ADMIN_EMAIL"].dup
    password ENV["ADMIN_PASSWORD"].dup
    password_confirmation ENV["ADMIN_PASSWORD"].dup
  end
end

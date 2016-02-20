FactoryGirl.define do
  factory :admin do
    sequence(:email) { |n| "admin#{n}@example.com"}
    sequence(:admin_name) { |n| "admin#{n}"}
    password 'pw'
    suspended false
  end
end
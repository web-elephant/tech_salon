FactoryGirl.define do
  factory :cliant do
    sequence(:email) { |n| "cliant#{n}@example.com"}
    sequence(:company_name) { |n| "cliant#{n}"}
    password 'pw'
    suspended false
  end
end
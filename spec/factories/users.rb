# spec/factories/users.rb
FactoryBot.define do
factory :user do
    firstname { "John" }
    lastname { "Doe" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password" }
    role_id { 1 }
    company_id { 1 }
    association :role, factory: :role
    association :company, factory: :company
end
end

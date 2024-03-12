# spec/factories/users.rb
FactoryBot.define do
factory :user do
    firstname { "John" }
    lastname { "Doe" }
    email { "john2@example.com" }
    password { "password" }
    role_id { 1 }
    company_id { 1 }
    association :role, factory: :role
    association :company, factory: :company
end
end

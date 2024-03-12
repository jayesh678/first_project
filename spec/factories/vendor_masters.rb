# spec/factories/vendor_masters.rb
FactoryBot.define do
    factory :vendor_master do
      sequence(:customer_name) { |n| "Customer #{n}" }
      sequence(:customer_code) { |n| "C#{n}" }
      sequence(:corporate_number) { |n| "Corp#{n}" }
      sequence(:invoice_number) { |n| "Inv#{n}" }
    end
  end
  
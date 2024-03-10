FactoryBot.define do
    factory :business_partner do
      customer_code { "ABC123" }
      corporate_number { "XYZ456" }
      invoice_number { "INV789" }
      bank_name { "Example Bank" }
      address { "123 Main Street" }
      postal_code { 12345 }
      telephone_number { "1234567890" }
  
      # Other attributes if needed
    end
  end
  
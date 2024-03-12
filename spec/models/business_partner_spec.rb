require 'rails_helper'

RSpec.describe BusinessPartner, type: :model do
  describe "validations" do
  it "is valid with valid attributes" do
    business_partner = build(:business_partner) # Using the factory
    expect(business_partner).to be_valid
  end

  it "is invalid without a customer code" do
    business_partner = build(:business_partner, customer_code: nil)
    expect(business_partner).not_to be_valid
  end

  it "is invalid without a corporate number" do
    business_partner = build(:business_partner, corporate_number: nil)
    expect(business_partner).not_to be_valid
  end

  it "is invalid without an invoice number" do
    business_partner = build(:business_partner, invoice_number: nil)
    expect(business_partner).not_to be_valid
  end

  it "is invalid without a bank name" do
    business_partner = build(:business_partner, bank_name: nil)
    expect(business_partner).not_to be_valid
  end

  it "is invalid without an address" do
    business_partner = build(:business_partner, address: nil)
    expect(business_partner).not_to be_valid
  end

  it "is invalid without a postal code" do
    business_partner = build(:business_partner, postal_code: nil)
    expect(business_partner).not_to be_valid
  end

  it "is invalid with a non-integer postal code" do
    business_partner = build(:business_partner, postal_code: 'ABC')
    expect(business_partner).not_to be_valid
  end

  it "is invalid with a postal code less than 10000" do
    business_partner = build(:business_partner, postal_code: 9999)
    expect(business_partner).not_to be_valid
  end

  it "is invalid with a postal code greater than 99999" do
    business_partner = build(:business_partner, postal_code: 100000)
    expect(business_partner).not_to be_valid
  end

  it "is invalid without a telephone number" do
    business_partner = build(:business_partner, telephone_number: nil)
    expect(business_partner).not_to be_valid
  end

  it "is invalid with a telephone number shorter than 10 digits" do
    business_partner = build(:business_partner, telephone_number: '123456789')
    expect(business_partner).not_to be_valid
  end

  it "is invalid with a telephone number longer than 10 digits" do
    business_partner = build(:business_partner, telephone_number: '12345678901')
    expect(business_partner).not_to be_valid
  end
end
end

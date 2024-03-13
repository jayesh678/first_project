class BusinessPartner < ApplicationRecord
  has_many :expenses
  belongs_to :company

  validates :customer_code, presence: true
  validates :corporate_number, presence: true
  validates :invoice_number, presence: true
  validates :bank_name, presence: true    
  validates :address, presence: true
  validates :postal_code, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 10000, less_than_or_equal_to: 99999 }
  validates :telephone_number, presence: true, length: { maximum: 10, minimum: 10 }
end

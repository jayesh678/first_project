class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :business_partners
  
  before_create :generate_company_code
  before_create :generate_uniqueid
  
  private
  
  def generate_company_code
    self.company_code = SecureRandom.hex(4).upcase
  end
  
  def generate_uniqueid
    self.company_uniqueid = SecureRandom.hex(4) 
  end
end

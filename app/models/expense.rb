class Expense < ApplicationRecord
  belongs_to :flow
  belongs_to :user
  belongs_to :business_partner
  belongs_to :category
  has_many :subcategories
  has_one_attached :receipt
  
  before_create :generate_application_number

  enum status: { ideal: 0, initiated: 1, approved: 2, cancelled: 3 }

  validates :application_number, uniqueness: true
  validates :application_name, presence: true 
  validates :total_amount, presence: true 
  validates :date_of_application, presence: true
  validates :expense_date, presence: true
  validates :category, presence: true
  validates :business_partner, presence: true
  validate :non_negative_integer
  validates :description, presence: true
  validates :receipt, presence: true
  validates_presence_of :start_date, :end_date, :source, :destination, if: :travel_expense
  validate :end_date_is_after_start_date, if: -> { travel_expense && start_date.present? && end_date.present? }

  def travel_expense
    category_id == Category.find_by(category_type: "Travel")&.id
  end

  def non_negative_integer
    errors.add(:number_of_people, "cannot be negative") if number_of_people.nil? || number_of_people.negative?
    errors.add(:amount, "cannot be negative") if amount.nil? || amount.negative?
    errors.add(:tax_amount, "cannot be negative") if tax_amount.nil? || tax_amount.negative?
  end

  private

  def generate_application_number
    category_prefix = category_prefix_for_application_number
    last_application_number = Expense.where(category_id: category_id).maximum(:application_number).to_i
    new_application_number = last_application_number + 1
    loop do
      candidate_application_number = "#{category_prefix}#{new_application_number}"
      unless Expense.exists?(application_number: candidate_application_number)
        self.application_number = candidate_application_number
        break
      end
      new_application_number += 1
    end
  end 

  def category_prefix_for_application_number
    category_id == 1 ? 'E-' : 'T-'
  end

  def end_date_is_after_start_date
    errors.add(:end_date, "cannot be before the start date") if end_date < start_date
  end

  def self.approved_expenses_report
    approved_expenses = Expense.where(status: "approved")
    return approved_expenses
  end
end

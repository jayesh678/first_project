class AddCompanyIdToFlows < ActiveRecord::Migration[7.1]
  def change
    add_reference :flows, :company, null: true, foreign_key: true
  end
end

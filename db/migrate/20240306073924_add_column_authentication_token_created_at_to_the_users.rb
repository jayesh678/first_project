class AddColumnAuthenticationTokenCreatedAtToTheUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :authentication_token_created_at_from_users, :datetime
  end
end

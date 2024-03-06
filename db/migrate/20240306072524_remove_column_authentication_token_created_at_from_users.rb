class RemoveColumnAuthenticationTokenCreatedAtFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :authentication_token_created_at, :datetime
  end
end

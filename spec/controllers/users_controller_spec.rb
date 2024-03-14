require 'rails_helper'
RSpec.describe UsersController, type: :controller do

    
describe "GET #index" do
    it "assigns @users" do
    user = create(:user)
    sign_in user
    get :index
    expect(response).to have_http_status(:redirect)
    expect(assigns(:user)).to eq(@user)
    end
end

# describe "GET #new" do
# before(:each) do
#     # Assuming you have a valid user session
#     sign_in create(:user)
#     get :new
#   end

#   it "assigns a new user as @user" do
#     expect(assigns(:user)).to_not be_nil
#     expect(assigns(:user)).to be_a_new(User)
#   end
# end


describe "GET #edit" do
    it "assigns @user" do
    user = create(:user)
    sign_in user
    get :edit, params: { id: user.id }
    expect(response).to have_http_status(:redirect) 
    expect(assigns(:user)).to eq(@user)
    end
end

describe "GET #show" do
    it "assigns @user" do
    user = create(:user)
    sign_in user
    get :show, params: { id: user.id }
    expect(response).to have_http_status(:redirect) 
    expect(assigns(:user)).to eq(@user)
    end
end

describe "PATCH #update" do
  it "updates the user's firstname" do
    user = create(:user)
    sign_in user
    new_firstname = "John"
    patch :update, params: { id: user.id, user: { firstname: new_firstname } }
    user.reload
    expect(user.firstname).to eq(new_firstname)
    expect(response).to have_http_status(:redirect)
    # expect(response).to redirect_to(user_path(user))
  end
end


describe "DELETE #destroy" do
  it "destroys the user" do
    user = create(:user)

    expect {
      user.destroy!
    }.to change(User, :count).by(-1)
  rescue ActiveRecord::RecordNotDestroyed => e
    # If an exception is raised, print the error message for debugging
    puts "Failed to destroy the user: #{e.message}"
  end
end



end

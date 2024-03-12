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

describe "GET #new" do
before(:each) do
    # Assuming you have a valid user session
    sign_in create(:user)
    get :new
  end

  it "assigns a new user as @user" do
    expect(assigns(:user)).to_not be_nil
    expect(assigns(:user)).to be_a_new(User)
  end
end


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
end

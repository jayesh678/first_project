# spec/controllers/business_partners_controller_spec.rb
require 'rails_helper'

RSpec.describe BusinessPartnersController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:business_partner) { create(:business_partner) }

    it "returns a success response" do
      get :show, params: { id: business_partner.id }
      expect(response).to be_successful
    end

    it "assigns the requested business_partner as @business_partner" do
      get :show, params: { id: business_partner.id }
      expect(assigns(:business_partner)).to eq(business_partner)
    end
  end

  describe "GET #edit" do
    let(:business_partner) { create(:business_partner) }

    it "returns a success response" do
      get :edit, params: { id: business_partner.id }
      expect(response).to be_successful
    end

    it "assigns the requested business_partner as @business_partner" do
      get :edit, params: { id: business_partner.id }
      expect(assigns(:business_partner)).to eq(business_partner)
    end
  end

  describe "PUT #update" do
    let(:business_partner) { create(:business_partner) }

    context "with valid params" do
      let(:new_attributes) { { customer_code: "new_code" } }

      it "updates the requested business_partner" do
        put :update, params: { id: business_partner.id, business_partner: new_attributes }
        business_partner.reload
        expect(business_partner.customer_code).to eq("new_code")
      end

      it "redirects to the business_partner" do
        put :update, params: { id: business_partner.id, business_partner: new_attributes }
        expect(response).to redirect_to(business_partner)
      end
    end

    context "with invalid params" do
      it "renders the edit template" do
        put :update, params: { id: business_partner.id, business_partner: { customer_code: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:business_partner) { create(:business_partner) }

    it "destroys the requested business_partner" do
      expect {
        delete :destroy, params: { id: business_partner.id }
      }.to change(BusinessPartner, :count).by(-1)
    end

    it "redirects to the business_partners list" do
      delete :destroy, params: { id: business_partner.id }
      expect(response).to redirect_to(business_partners_url)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new BusinessPartner" do
        expect {
          post :create, params: { business_partner: attributes_for(:business_partner) }
        }.to change(BusinessPartner, :count).by(1)
      end

      it "redirects to the created business_partner" do
        post :create, params: { business_partner: attributes_for(:business_partner) }
        expect(response).to redirect_to(business_partner_path(BusinessPartner.last))
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, params: { business_partner: attributes_for(:business_partner, customer_code: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #fetch_customer_details" do
    let(:vendor_master) { create(:vendor_master) }

    it "returns a success response" do
      get :fetch_customer_details, params: { customer_name: vendor_master.customer_name }, format: :js
      expect(response).to be_successful
    end

    it "assigns the customer details as @customer_details" do
      get :fetch_customer_details, params: { customer_name: vendor_master.customer_name }, format: :js
      expect(assigns(:customer_details)).to eq([vendor_master])
    end
  end
end

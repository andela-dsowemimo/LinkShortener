require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    before :each do
      @daisi = create(:user)
    end
    it "returns http success" do
      get :show, id: @daisi
      expect(response).to have_http_status(:success)
    end
    it "renders the show template" do
      get :show, id: @daisi
      expect(response).to render_template(:show)
    end
    it "assigns the correct user" do
      get :show, id: @daisi
      expect(assigns(:user)).to eq(@daisi)
    end
  end

  describe "POST #create" do
    context "valid user" do
      it "redirects to user#show page upon save" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to user_path assigns[:user]
      end
    end

    context "non valid user" do
      it "renders new page" do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to redirect_to new_user_path
      end
    end
  end

end

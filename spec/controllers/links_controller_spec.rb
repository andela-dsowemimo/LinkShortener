require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns all the links" do
      link = create(:link)
      link_2 = create(:link, user: nil)
      get :index
      expect(assigns(:links)).to  match_array([link, link_2])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, link: attributes_for(:link)
      expect(response).to have_http_status(:success)
    end
  end

end

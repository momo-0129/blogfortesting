require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  let(:user) { create(:user) }

  describe "GET /index" do
    it 'assigns @users' do
      all_users = User.all
      get "/users"
      expect(assigns(:users)).to eq(all_users)
    end 

    it "renders the :index view" do 
      get "/users"
      expect(response).to render_template(:index)
    end
  end

  describe "GET users#show" do
    it "should render users#show template" do
      visit user_path(user.id)
      expect(page).to have_content(user.username)
    end
  end

  describe "POST #create" do
    context "success" do
      it "create a new user" do
        user = create(:user)
        visit signup_path
    
        fill_in "user_username", with: "momo2"
        fill_in "user_email", with: "momo2@momo.com"
        fill_in "user_password", with: "password"
    
        expect { click_button "Create User" }.to change(User, :count).by(1)
      end
    end

    context "failure" do
      it "redirects to 'new_user_path' when create fails" do
        user = create(:user)
        visit signup_path

        fill_in "user_username", with: " "
        fill_in "user_email", with: " "
        fill_in "user_password", with: " "
      
       expect { click_button "Create User" }.to_not change(User, :count)
      end
    end
  end



end

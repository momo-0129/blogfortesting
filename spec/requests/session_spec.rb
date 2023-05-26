require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user) }

  describe "GET /login" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status :success
    end
  end

  describe "#create" do
    it "creates a new session" do
      visit "/login"

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"

      visit user_path(user.id)
      expect(page).to have_content(user.username)
      expect(page).to have_button("Logout")
      expect(page).to_not have_button("Login")
    end
  end


end

require 'rails_helper'

RSpec.describe "Articles Controller test", type: :request do
  let(:article) { create(:article) }
  let(:user) { create(:user) }

  describe "GET /index" do
    it 'assigns @articles' do
      all_articles = Article.all
      get "/articles"
      expect(assigns(:articles)).to eq(all_articles)
    end 

    it "renders the :index view" do 
      get "/articles"
      expect(response).to render_template(:index)
    end
  end

  describe "GET articles#show" do
    it "should render articles#show template" do
      visit article_path(article.id)
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.description)
    end
  end

  describe "GET #new" do
    it "assigns @article" do
      get "/articles/new"
      expect(assigns(:article)).to be_instance_of(Article)
    end

    it "renders the :new view" do
      get "/articles/new"
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    before do
      user = create :user
      visit "/login"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end
    context "success" do
      it "create a new article" do
        article = create(:article)
        visit "/articles/new"

        fill_in "article_title", with: "Ruby on Rails"
        fill_in "article_description", with: "Text about Ruby on Rails"
    
        expect { click_button "Create Article" }.to change(Article, :count).by(1)
      end
    end

    context "failure" do
      it "redirects to 'new_article_path' when create fails" do
        visit "/articles/new"
        article = create(:article)

        fill_in "article_title", with: " "
        fill_in "article_description", with: " "
      
        click_button "Create Article" 
        expect(page).to have_content 'errors'
      end
    end
  end

  describe "PUT articles#update" do
    it "should update an existing article" do
      article = create(:article)
      visit edit_article_path(article)

      fill_in "article_title", with: "edit article title"
      fill_in "article_description", with: "edit article description"

      click_button "Update"
      expect(article.reload.title).to eq "edit article title"
      expect(article.reload.description).to eq "edit article description"
    end
  end

  describe "DELETE articles#destroy" do
    it "should delete an existing article" do
      visit article_path(article.id)
      
      expect(page).to have_link("Delete")
      expect { click_link "Delete" }.to change(Article, :count).by(-1)
    end
  end


end

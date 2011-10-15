require 'spec_helper'

describe Blogr::Admin::CategoriesController do
  context "rendering" do
    before do
      Blogr::User.all.map(&:delete)
      @user = Blogr::User.create!(:name => "Daniel", :email => "daniel@daniel22z.nl", :password => "qwe123", :password_confirmation => "qwe123")
      session[:user_id] = @user.id
      current_user = @user
    end

    it "renders index" do
      get :index
      response.should be_success
    end

    it "renders new" do
      get :new
      response.should be_success
    end
  end

  context "creation" do
    before do
      Blogr::Category.all.map(&:delete)
      @user = Blogr::User.first ||= Blogr::User.create!(:name => "Daniel", :email => "daniel@daniel22z.nl", :password => "qwe123", :password_confirmation => "qwe123")
      session[:user_id] = @user.id
      current_user = @user
    end
    it "creates a valid category object" do
      post :create, :blogr_category => {
        :title => "Algemeen"
        }
      response.should be_redirect
      Blogr::Category.count.should == 1
    end

    it "renders :new if category is invalid" do
      lambda do
        post :create, :blogr_category => {
          }
        end.should_not change(Blogr::Category, :count).by(1)
      response.should render_template("new")
    end
  end

  context "deletion" do
    it "Deletes an category" do
      @category = Blogr::Category.create(:title => "category1")
      delete :destroy, :id => @category.id
    end
  end

end
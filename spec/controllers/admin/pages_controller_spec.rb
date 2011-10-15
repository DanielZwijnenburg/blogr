require 'spec_helper'

describe Blogr::Admin::PagesController do
  context "rendering" do
    before do
      @user = Blogr::User.first ||= Blogr::User.create!(:name => "Daniel", :email => "daniel@d33anielz.nl", :password => "qwe123", :password_confirmation => "qwe123")
      session[:user_id] = @user.id
      current_user = @user
    end
    it "renders index" do
      get :index

      response.should be_success
    end

    it "renders show" do
      @page = Blogr::Page.first
      get :show, :id => @page.id

      response.should be_success

    end

    it "renders new" do
      get :new
      response.should be_success
    end
  end

  context "creation" do
    before do
      Blogr::Page.all.map(&:delete)
      Blogr::Page.create(:menu_item => "blog", :position => 1, :title => "blog", :body => "This page refers to the /blog route. If you remove or rename this page you wont have an blog menu item.", :hidden => 0)
      @user = Blogr::User.first ||= Blogr::User.create!(:name => "Daniel", :email => "daniel@dan33ielz.nl", :password => "qwe123", :password_confirmation => "qwe123")
      session[:user_id] = @user.id
      current_user = @user
    end
    it "creates a valid page object" do
      lambda do
        post :create, :blogr_page => {
          :menu_item => "Menu1",
          :title => "Welkom",
          :body => "Op mijn blog!"
          }
        end.should change(Blogr::Page, :count).by(1)
      response.should be_redirect
      Blogr::Page.count.should == 2
    end


    it "renders :new if page is invalid" do
      lambda do
        post :create, :blogr_page => {
          :body => "Welkom op mijn blog"
          }
        end.should_not change(Blogr::Page, :count).by(1)
      response.should render_template("new")
    end
  end

  context "Hide/Unhide page" do
    it "Hide an unhidden page" do
      @page = Blogr::Page.first
      get :hide, {
          :id => @page.id
      }
      @page.hidden == true
      response.should be_redirect

    end


    it "Unhide an hidden page" do
      @page = Blogr::Page.first
      get :unhide, {
          :id => @page.id
      }
      @page.hidden == false
      response.should be_redirect

    end
  end

  context "deletion" do
    it "Deletes an page" do
      @page = Blogr::Page.create(:menu_item => "blog", :position => 1, :title => "blog", :body => "This page refers to the /blog route. If you remove or rename this page you wont have an blog menu item.", :hidden => 0)
      delete :destroy, :id => @page.id
    end
  end

end
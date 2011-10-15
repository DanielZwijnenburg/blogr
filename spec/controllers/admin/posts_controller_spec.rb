require 'spec_helper'

describe Blogr::Admin::PostsController do
  context "rendering" do
    before do
      @post = Blogr::Post.create(:title => "Index", :body => "Welkom op mijn blog")
      @user = Blogr::User.first ||= Blogr::User.create!(:name => "Daniel", :email => "daniel@danielz22.nl", :password => "qwe123", :password_confirmation => "qwe123")
      session[:user_id] = @user.id
      current_user = @user
    end

    it "renders index" do
      get :index

      response.should be_success
    end

    it "renders show" do
      get :show, :id => @post.id

      response.should be_success
    end

    it "renders new" do
      get :new

      response.should be_success
    end
  end

  context "creation" do
    before do
      @user = Blogr::User.first ||= Blogr::User.create!(:name => "Daniel", :email => "daniel@dani44elz.nl", :password => "qwe123", :password_confirmation => "qwe123")
      session[:user_id] = @user.id
      current_user = @user
    end
    it "creates a valid post object" do
      lambda do
        post :create, :blogr_post => {
          :title => "Index",
          :body => "Welkom op mijn blog"
          }
        end.should change(Blogr::Post, :count).by(1)
      response.should be_redirect
    end

    it "renders :new if post is invalid" do
      lambda do
        post :create, :blogr_post => {
          :body => "Welkom op mijn blog"
          }
        end.should_not change(Blogr::Post, :count).by(1)
      response.should render_template("new")
    end


  end

  context "publish post" do
    it "published an unpublished post" do
      @post = Blogr::Post.create(:title => "Index", :body => "Welkom op mijn blog", :published => 0)
      get :publish, {
          :id => @post.id
      }
      @post.published == 1
    end
  end

  context "deletion" do
    it "Deletes an post" do
      @post = Blogr::Post.create(:title => "Index", :body => "Welkom op mijn blog", :published => 1)
      delete :destroy, :id => @post.id
    end
  end

end
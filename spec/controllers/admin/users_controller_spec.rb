require 'spec_helper'

describe Blogr::Admin::UsersController do
  context "rendering" do
    it "renders new" do
      get :new
      response.should be_success
    end
  end

  context "creation" do
    before do
      Blogr::User.all.map(&:delete)
    end
    it "creates a valid user object" do
      lambda do
        post :create, :blogr_user => {
          :name => "Daniel",
          :password => "test",
          :password_confirmation => "test",
          :email => "daniel1@danielz.nl"
        }
        end.should change(Blogr::User, :count).by(1)
      response.should be_redirect
      Blogr::User.count.should == 1
    end


    it "renders :new if user object is invalid" do
      lambda do
        post :create, :blogr_user => {
          :name => "Daniel",
          :password => "test",
          :password_confirmation => "test"
        }
        end.should_not change(Blogr::User, :count).by(1)
      response.should render_template("new")
    end
  end
end
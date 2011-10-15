require 'spec_helper'

describe Blogr::PostsController do
  context "rendering" do
    before do
      @post = Blogr::Post.create(:title => "Welcome to my blog!", :body => "Hello i'm DanielZ this is a test post for my epic rails engine!")
    end

    it "renders index" do
      get :index

      response.should be_success
    end

    it "renders show" do
      get :show, :id => @post.id

      response.should be_success
    end
  end

end
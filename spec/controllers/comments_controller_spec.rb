require 'spec_helper'

describe Blogr::CommentsController do
  before do
    @post = Blogr::Post.create(:title => "Welcome to my blog!", :body => "Hello i'm DanielZ this is a test post for my epic rails engine!")
  end
  it "Creates a valid comment object" do
      # post :create, :post_id => @post.id, :comment => {
      #    :name   =>  "Jeroen Hammann",
      #    :title  =>  "Daniel_is_my_hero",
      #    :body   =>  "Daniel_is_1337"
      #  }
      # response.should redirect_to(blogr_post_path(@post))
      # comment.title.should == 'Daniel_is_my_hero'

  end
end
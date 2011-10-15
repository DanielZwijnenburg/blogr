require 'spec_helper'

describe Blogr::Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it "should create a new post instance given valid attributes" do
    attrs = {
             :title => "Welcome to my blog!",
             :body => "Hello i'm DanielZ this is a test post for my epic rails engine!"
             }
    post = Blogr::Post.new(attrs)
    post.should be_valid
    post.should be_an_instance_of(Blogr::Post)
    post.save!
  end

  it "should not create a new post instance given unvalid attributes" do
    attrs = {
             :body => "Hello i'm DanielZ this is a test post for my epic rails engine!"
             }
    post = Blogr::Post.new(attrs)
    post.should_not be_valid
  end


  it "should publish the post" do
    attrs = {
             :title => "Post 1",
             :body => "Hello i'm DanielZ want to get in touch? Mail me @ daniel@danielz.nl",
             :published => 0
             }
   post = Blogr::Post.new(attrs)
   post.should be_valid
   post.should be_an_instance_of(Blogr::Post)
   post.save!

   post.published.should == false
   post.publish!
   post.published.should == true
  end

end
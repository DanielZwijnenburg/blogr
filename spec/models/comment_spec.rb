require 'spec_helper'

describe Blogr::Comment do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:post)}

  it "should create a new comment instance associated to a given post with valid attributes" do
    attrs1 = {
             :title => "Welcome to my blog!",
             :body => "Hello i'm DanielZ this is a test post for my epic rails engine!"
             }
    @post = Blogr::Post.new(attrs1)
    @post.should be_valid
    @post.save!
    @post.should be_an_instance_of(Blogr::Post)

    attrs2 = {
        :post_id => 1,
          :name => "daniel",
          :title =>"title",
          :body =>"comment"
    }

    @comment = Blogr::Comment.new(attrs2)
    @comment.should be_valid
    @comment.save!
    @comment.should be_an_instance_of(Blogr::Comment)
  end

end
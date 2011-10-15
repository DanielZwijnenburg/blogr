require 'spec_helper'

describe Blogr::Page do
  it { should validate_presence_of(:menu_item) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it "should create a new page instance given valid attributes" do
    attrs = {
             :menu_item => "Contact",
             :title => "Contact with DanielZ",
             :body => "Hello i'm DanielZ want to get in touch? Mail me @ daniel@danielz.nl"
             }
    page = Blogr::Page.new(attrs)
    page.should be_valid
    page.should be_an_instance_of(Blogr::Page)
    page.save!
  end

  it "should not create a new page instance given unvalid attributes" do
    attrs = {
             :body => "Hello i'm DanielZ this is a test post for my epic rails engine!"
             }
    page = Blogr::Page.new(attrs)
    page.should_not be_valid
  end

  it "should hide the page" do
    attrs = {
             :menu_item => "Contact",
             :title => "Contact with DanielZ",
             :body => "Hello i'm DanielZ want to get in touch? Mail me @ daniel@danielz.nl"
             }
   page = Blogr::Page.new(attrs)
   page.should be_valid
   page.should be_an_instance_of(Blogr::Page)
   page.save!

   page.hidden.should == false
   page.hide!
   page.hidden.should == true
  end

  it "should unhide the page" do
    attrs = {
             :menu_item => "Contact",
             :title => "Contact with DanielZ",
             :body => "Hello i'm DanielZ want to get in touch? Mail me @ daniel@danielz.nl",
             :hidden => true
             }
   page = Blogr::Page.new(attrs)
   page.should be_valid
   page.should be_an_instance_of(Blogr::Page)
   page.save!

   page.hidden.should == true
   page.unhide!
   page.hidden.should == false
  end
end
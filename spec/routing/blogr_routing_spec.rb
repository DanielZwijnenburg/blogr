require 'spec_helper'

describe "BlogrURLs" do
  it "should list the blog pages at /pages" do
     { :get => '/blog' }.should route_to(:controller => "blogr/posts", :action => "index")
  end

  it "does not list all the pages" do
     { :get => '/blogr' }.should_not be_routable
  end
end
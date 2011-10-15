require 'spec_helper'

describe Blogr::PagesController do
  context "rendering" do

    it "renders show" do
      get :show, :id => Blogr::Page.first

      response.should be_success
    end

  end

end
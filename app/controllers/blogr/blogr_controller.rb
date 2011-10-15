module Blogr
  class BlogrController < ApplicationController
    unloadable
    layout "blogr"
    before_filter :construct_menu

    def construct_menu
      @menu_items = Page.where("hidden = 0").order("position ASC")
    end

  end
end
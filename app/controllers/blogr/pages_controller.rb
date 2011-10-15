module Blogr
  class PagesController < BlogrController
    unloadable

    def show
      @page = Page.find(params[:id])
      @invoice = Inquire.new if @page.has_inquire?
    end

  end
end
module Blogr
  class InquiriesController < BlogrController
    unloadable
    before_filter :get_page

    def create
      @inquire = @page.inquiries.new(params[:blogr_inquire])
      if @inquire.save
        flash[:notice] = 'inquire was successfully created.'
        redirect_to blogr_page_path(@page)
      else
        flash[:notice] = 'Either your name or the message was invalid.'
        redirect_to blogr_page_path(@page)
      end
    end

    private
    def get_page
      @page = Page.find(params[:page_id])
      rescue ActiveRecord::RecordNotFound
        redirect_to blogr_pages_path
    end
  end
end
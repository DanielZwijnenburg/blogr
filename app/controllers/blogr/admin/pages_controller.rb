module Blogr
  class Admin::PagesController < Admin::BlogrAdminController
    unloadable

    before_filter :get_page, :only => [:edit, :show, :update, :destroy, :hide, :unhide]

    def index
      @pages = Page.find(:all, :order => "position ASC")
    end

    def new
      @page = Page.new
    end

    def edit
    end

    def show
    end

    def create
      @page = Page.new(params[:blogr_page])
      @page.position = Page.last_position + 1
      if @page.save
        Activity.create :who => current_user.name, :what => "New page created:  #{@page.title}"
        redirect_to blogr_admin_page_path(@page), :notice => "Page sucesfully created"
      else
        render :action => "new"
      end
    end

    def update
      if @page.update_attributes(params[:blogr_page])
        Activity.create :who => current_user.name, :what => "Page updated: #{@category.title}"
        redirect_to blogr_admin_pages_path, :notice => "Page was successfully updated."
      else
        render :action => "edit"
      end
    end

    def destroy
      @page.destroy
      Activity.create :who => current_user.name, :what => "Destroyed: #{@page.title}"
      redirect_to blogr_admin_pages_path, :notice => "Page sucesfully deleted"
    end

    def hide
      @page.hide!
      Activity.create :who => current_user.name, :what => "Hide: #{@page.title}"
      redirect_to blogr_admin_pages_path, :notice => "Page sucesfully hidden"
    end

    def unhide
      @page.unhide!
      Activity.create :who => current_user.name, :what => "Unhide: #{@page.title}"
      redirect_to blogr_admin_pages_path, :notice => "Page sucesfully unhidden"
    end

    def update_page
      @pages = Page.find(:all, :order => "position ASC")
    end

    def update_positions
      arr = params[:positionArray]
      arr = arr.split(/\s*,\s*/)
      pos_array = []

      arr.each_with_index do |old_pos, i|
        page = Page.find_by_position(old_pos)
        pos_array << page
      end

      pos_array.each_with_index do |page, i|
        page.update_attributes(:position => i)
      end
      render :nothing => true
    end

    private

    def get_page
      @page = Page.find(params[:id])
      redirect_to pages_path, :notice => "Page either got deleted or it was invalid" if @page.hidden == 1
      rescue ActiveRecord::RecordNotFound
        redirect_to pages_path, :notice => "Page either got deleted or it was invalid"
    end
  end
end
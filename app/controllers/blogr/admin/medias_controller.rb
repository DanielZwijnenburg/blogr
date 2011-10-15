module Blogr
  class Admin::MediasController < Admin::BlogrAdminController
    unloadable

    before_filter :get_media, :only => [:edit, :show, :update, :destroy, :publish]

    def index
      @medias = Media.page(params[:page])
    end

    def new
      @media = Media.new
    end

    def edit
    end

    def create
      @media = Media.new(params[:blogr_media])
      if @media.save
        Activity.create :who => current_user.name, :what => "New media created: #{@media.title}"
        redirect_to blogr_admin_medias_path, :notice => "Media was successfully created."
      else
        render :action => "new"
      end
    end

    def update
      if @media.update_attributes(params[:blogr_media])
        Activity.create :who => current_user.name, :what => "Media updated: #{@media.title}"
        redirect_to blogr_admin_medias_path, :notice => "Media was successfully updated."
      else
        render :action => "edit"
      end
    end

    def destroy
      @media.destroy
      Activity.create :who => current_user.name, :what => "Destroyed: #{@media.title}"
      redirect_to blogr_admin_medias_path, :notice => "Media was successfully deleted."
    end

    def overview
      @medias = Media.page(params[:page])
      render :layout => "images"
    end

    private

    def get_media
      @media = Media.find(params[:id])
    end
  end
end
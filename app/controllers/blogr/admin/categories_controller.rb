module Blogr
  class Admin::CategoriesController < Admin::BlogrAdminController
    unloadable

    before_filter :get_category, :only => [:edit, :update, :destroy, :publish]

    def index
      @categories = Category.page(params[:page])
    end

    def new
      @category = Category.new
    end

    def edit
    end

    def create
      @category = Category.new(params[:blogr_category])
      if @category.save
        Activity.create :who => current_user.name, :what => "New category created: #{@category.title}"
        redirect_to blogr_admin_categories_path, :notice => "Category was successfully created."
      else
        render :action => "new"
      end
    end

    def update
      if @category.update_attributes(params[:blogr_category])
        Activity.create :who => current_user.name, :what => "Category updated: #{@category.title}"
        redirect_to blogr_admin_categories_path, :notice => "Category was successfully updated."
      else
        render :action => "edit"
      end
    end

    def destroy
      @category.destroy
      Activity.create :who => current_user.name, :what => "Destroyed: #{@category.title}"
      redirect_to blogr_admin_categories_path, :notice => "Category was successfully deleted."
    end

    private

    def get_category
      @category = Category.find(params[:id])
    end
  end
end
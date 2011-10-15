module Blogr
  class Admin::PostsController < Admin::BlogrAdminController
    unloadable

    before_filter :get_post, :only => [:edit, :show, :update, :destroy, :publish]

    def index
      @posts = Post.page(params[:page])
    end

    def new
      @post = Post.new
      @categories = Category.all
    end

    def edit
      @categories = Category.all
    end

    def show
    end

    def create
      @post = Post.new(params[:blogr_post])
      if @post.save
        Activity.create :who => current_user.name, :what => "New post created:  #{@post.title}"
        redirect_to blogr_admin_post_path(@post), :notice => "Post was successfully created."
      else
        render :action => "new"
      end
    end

    def update
      if @post.update_attributes(params[:blogr_post])
        Activity.create :who => current_user.name, :what => "Post updated: #{@category.title}"
        redirect_to blogr_admin_posts_path, :notice => "Post was successfully updated."
      else
        render :action => "edit"
      end
    end

    def destroy
      @post = Post.find(params[:id])
      Activity.create :who => current_user.name, :what => "Destroyed: #{@post.title}"
      @post.destroy
      redirect_to blogr_admin_posts_path, :notice => "Post was successfully deleted."
    end

    def publish
      @post.publish!
      Activity.create :who => current_user.name, :what => "published post #{@post.title}"
      redirect_to blogr_admin_posts_path, :notice => "Post sucesfully published"
    end

    private

    def get_post
      @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to posts_path, :notice => "Post either got deleted or it was invalid"
    end
  end
end
module Blogr
  class Admin::UsersController < Admin::BlogrAdminController
    skip_before_filter :require_user

    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:blogr_user])
      if @user.save
        redirect_to blogr_admin_posts_path, :notice => "Signed up!"
      else
        render "new", :notice => "Something went wrong!"
      end
    end
  end
end

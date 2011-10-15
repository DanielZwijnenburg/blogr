module Blogr
  class Admin::SessionsController < Admin::BlogrAdminController
    unloadable

    skip_before_filter :require_user
    before_filter :logged_in?, :except => [:destroy, :dashboard]

    def new
    end

    def create
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to dashboard_blogr_admin_sessions_path, :notice => "Logged in!"
      else
        flash.now.alert = "Invalid email or password"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to blogr_admin_login_path, :notice => "Logged out!"
    end

    def dashboard
      redirect_to blogr_admin_posts_path if !current_user
      @activities = Activity.page(params[:page])
    end

    private

    def logged_in?
      redirect_to blogr_admin_posts_path if current_user
    end
  end
end
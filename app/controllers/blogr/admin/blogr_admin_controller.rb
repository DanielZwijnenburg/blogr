module Blogr
  class Admin::BlogrAdminController < ApplicationController
    unloadable

    layout "blogr_admin"

    helper_method :current_user
    before_filter :require_user

    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_user
      redirect_to blogr_admin_login_path if !current_user
    end
  end
end
  require 'blogr'
  require 'rails'
  require 'rubygems'
  require 'paperclip'
  require 'kaminari'
  require 'bcrypt'
module Blogr
  class Engine < Rails::Engine
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
require 'bcrypt'
module Blogr
  class User < ActiveRecord::Base
    set_table_name "blogr_users"

    has_many :posts, :class_name => "Blogr::Post"

    # attr_accessible :name, :email, :password, :password_confirmation

    attr_accessor :password
    before_save :encrypt_password

    validates_confirmation_of :password
    validates_presence_of     :password, :on => :create
    validates_presence_of     :name

    validates :email,   :presence => true,
              :length => {:minimum => 3, :maximum => 254},
              :uniqueness => true,
              :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}


    def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end

    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
  end
end
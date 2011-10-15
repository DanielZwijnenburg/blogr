module Blogr
  class Inquire < ActiveRecord::Base
    set_table_name "blogr_inquiries"
    validates_presence_of :name, :email, :question
  	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    belongs_to :page, :class_name => "Blogr::Page"

    def has_inquire?
      has_inquire == true
    end
  end
end
module Blogr
  class Category < ActiveRecord::Base
    set_table_name "blogr_categories"
    has_many :posts, :class_name => "Blogr::Post"
    validates_presence_of :title

  end
end
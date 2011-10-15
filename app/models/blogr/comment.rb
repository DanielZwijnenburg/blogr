module Blogr
  class Comment < ActiveRecord::Base
    set_table_name "blogr_comments"
    belongs_to :post, :class_name => "Blogr::Post", :counter_cache => true
    validates_presence_of :name
    validates_presence_of :title
    validates_presence_of :body

  end
end
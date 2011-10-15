module Blogr
  class Activity < ActiveRecord::Base
    set_table_name "blogr_activities"

    validates_presence_of :what
    validates_presence_of :who

    default_scope :order => "created_at DESC"
    scope :latest_n, lambda {|limit| order("created_at DESC").limit(limit) }


    paginates_per 10
  end
end
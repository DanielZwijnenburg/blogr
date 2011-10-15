module Blogr
  class Page < ActiveRecord::Base
    set_table_name "blogr_pages"

    validates_presence_of :menu_item
    validates_presence_of :title
    validates_presence_of :body
    has_many :inquiries, :class_name => "Blogr::Inquire", :dependent => :destroy

    paginates_per 10

    def to_param
      "#{id}-#{title.parameterize}"
    end

    def hide!
      update_attribute :hidden, 1
    end

    def unhide!
      update_attribute :hidden, 0
    end

    def self.last_position
      Page.order("position DESC").first.position
    end

  end
end
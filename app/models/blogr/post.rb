module Blogr
  class Post < ActiveRecord::Base
    set_table_name "blogr_posts"

    has_many :comments, :class_name => "Blogr::Comment", :dependent => :destroy
    belongs_to :category, :class_name => "Blogr::Category"
    belongs_to :user, :class_name => "Blogr::User"

    validates_presence_of :title
    validates_presence_of :body

    paginates_per 10

    scope :published, where(:published => 1)

    def to_param
      "#{id}-#{title.parameterize}"
    end

    def publish!
      update_attribute :published, 1
    end

  end
end
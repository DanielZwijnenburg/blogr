module Blogr
  class Media < ActiveRecord::Base
    set_table_name "blogr_medias"

    validates_presence_of :title
    validates_attachment_presence :image
    has_attached_file :image, :styles => { :thumb => "100x100>", :medium => "300x300>", :big => "800x800>"  }

  end
end
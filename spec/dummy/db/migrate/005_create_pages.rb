class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :blogr_pages do |t|
      t.string    :menu_item
      t.integer   :position
      t.boolean   :hidden, :default => false
      t.string    :title
      t.text      :body
      t.boolean   :has_inquire, :default => false
      t.timestamps
    end
    Blogr::Page.create(:menu_item => "blog", :position => 1, :title => "blog", :body => "This page refers to the /blog route. If you remove or rename this page you wont have an blog menu item.")
  end

  def self.down
    drop_table :blogr_pages
  end
end
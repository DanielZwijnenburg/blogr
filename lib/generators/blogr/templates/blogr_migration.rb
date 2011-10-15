class CreateBlogrTables < ActiveRecord::Migration
  def self.up
    create_table :blogr_activities do |t|
      t.string    :what
      t.string    :who
      t.timestamps
    end

    create_table :blogr_posts do |t|
      t.integer   :category_id
      t.string    :title
      t.text      :body
      t.boolean   :published, :default => 0
      t.integer   :comments_count, :default => 0
      t.timestamps
    end

    create_table :blogr_comments do |t|
      t.integer   :post_id
      t.string    :name
      t.string    :title
      t.text      :body
      t.timestamps
    end

    create_table :blogr_pages do |t|
      t.string    :menu_item
      t.integer   :position
      t.boolean   :hidden, :default => false
      t.string    :title
      t.text      :body
      t.boolean   :has_inquire, :default => false
      t.timestamps
    end
    Blogr::Page.create(:menu_item => "blog", :position => 0, :title => "blog", :body => "This page refers to the /blog route. If you remove or rename this page you wont have a blog menu item.")

    create_table :blogr_categories do |t|
      t.string    :title
      t.timestamps
    end

    create_table :blogr_medias do |t|
      t.string      :title
      t.string      :image_file_name
      t.string      :image_content_type
      t.integer     :image_file_size
      t.datetime    :image_updated_at
      t.timestamps
    end

    create_table :blogr_users do |t|
      t.string      :name
      t.string      :email
      t.string      :password_hash
      t.string      :password_salt
      t.timestamps
    end

    create_table :blogr_inquiries do |t|
      t.integer     :page_id
      t.string      :name
      t.string      :email
      t.text        :question
      t.timestamps
    end

  end

  def self.down
    drop_table :blogr_posts
    drop_table :blogr_comments
    drop_table :blogr_pages
    drop_table :blogr_categories
    drop_table :blogr_activities
    drop_table :blogr_medias
    drop_table :blogr_users
    drop_table :blogr_inquiries
  end
end
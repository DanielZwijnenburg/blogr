class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :blogr_posts do |t|
      t.integer   :category_id
      t.string    :title
      t.text      :body
      t.boolean   :published, :default => 0
      t.integer   :comments_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :blogr_posts
  end
end
class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :blogr_comments do |t|
      t.integer   :post_id
      t.string    :name
      t.string    :title
      t.text      :body
      t.timestamps
    end
  end

  def self.down
    drop_table :blogr_comments
  end
end
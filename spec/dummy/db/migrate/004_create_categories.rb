class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :blogr_categories do |t|
      t.string    :title
      t.timestamps
    end
  end

  def self.down
    drop_table :blogr_categories
  end
end
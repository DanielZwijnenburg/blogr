class CreateMedias < ActiveRecord::Migration
  def self.up
    create_table :blogr_medias do |t|
      t.string      :title
      t.string      :image_file_name
      t.string      :image_content_type
      t.integer     :image_file_size
      t.datetime    :image_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :blogr_medias
  end
end
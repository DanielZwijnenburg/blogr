class CreateInquiries < ActiveRecord::Migration
  def self.up
    create_table :blogr_inquiries do |t|
      t.integer     :page_id
      t.string      :name
      t.string      :email
      t.text        :question
    end
  end

  def self.down
    drop_table :blogr_inquiries
  end
end

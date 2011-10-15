class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :blogr_activities do |t|
      t.string    :what
      t.string    :who
      t.timestamps
    end
  end

  def self.down
    drop_table :blogr_activities
  end
end
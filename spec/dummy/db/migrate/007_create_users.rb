class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :blogr_users do |t|
      t.string      :name
      t.string      :email
      t.string      :password_hash
      t.string      :password_salt
    end
  end

  def self.down
    drop_table :blogr_users
  end
end


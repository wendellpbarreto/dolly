class AddFbIdToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :fb_id, :string
  end
end

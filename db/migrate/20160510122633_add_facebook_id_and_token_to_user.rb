class AddFacebookIdAndTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_id, :string
    add_column :users, :fb_token, :string
  end
end

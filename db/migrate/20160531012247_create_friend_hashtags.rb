class CreateFriendHashtags < ActiveRecord::Migration
  def change
    create_table :friend_hashtags do |t|
      t.references :friend
      t.references :hashtag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

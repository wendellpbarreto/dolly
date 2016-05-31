class CreateFriendReactions < ActiveRecord::Migration
  def change
    create_table :friend_reactions do |t|
      t.references, :friend
      t.references :reaction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

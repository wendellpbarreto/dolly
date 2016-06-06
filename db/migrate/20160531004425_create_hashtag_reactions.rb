class CreateHashtagReactions < ActiveRecord::Migration
  def change
    create_table :hashtag_reactions do |t|
      t.references :hashtag, index: true, foreign_key: true
      t.references :reaction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

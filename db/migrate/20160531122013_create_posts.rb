class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :friend, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateUserReactions < ActiveRecord::Migration
  def change
    create_table :user_reactions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :reaction, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end

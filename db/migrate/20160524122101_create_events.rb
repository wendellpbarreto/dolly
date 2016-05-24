class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :when
      t.actable
      t.timestamps null: false
    end
  end
end

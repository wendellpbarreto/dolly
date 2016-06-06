class DropStatusColumnFromReaction < ActiveRecord::Migration
  def change
  	remove_column :reactions, :status
  end
end

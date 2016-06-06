class DropReferencesFromMessage < ActiveRecord::Migration
  def change
    remove_reference :messages, :action
    remove_reference :messages, :user
  end
end

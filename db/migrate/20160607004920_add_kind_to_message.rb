class AddKindToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :kind, :string
  end
end

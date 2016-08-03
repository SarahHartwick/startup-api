class RenameColumnOwnerIdPerson < ActiveRecord::Migration
  def change
    rename_column :ideas, :ownerId, :person
  end
end

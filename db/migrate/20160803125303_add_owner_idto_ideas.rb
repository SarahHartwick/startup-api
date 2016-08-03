class AddOwnerIdtoIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :ownerId, :integer
  end
end

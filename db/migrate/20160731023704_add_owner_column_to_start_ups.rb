class AddOwnerColumnToStartUps < ActiveRecord::Migration
  def change
    add_column :start_ups, :owner, :string
  end
end

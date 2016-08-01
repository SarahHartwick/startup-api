class AddNewColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :givenName, :string
    add_column :users, :lastName, :string
    add_column :users, :location, :string
  end
end

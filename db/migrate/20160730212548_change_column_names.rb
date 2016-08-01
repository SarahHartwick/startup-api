#
class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column :users, :givenName, :givenname
    rename_column :users, :lastName, :lastname
  end
end

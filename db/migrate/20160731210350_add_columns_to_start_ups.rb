class AddColumnsToStartUps < ActiveRecord::Migration
  def change
    add_column :start_ups, :problem, :string
    add_column :start_ups, :solution, :string
  end
end

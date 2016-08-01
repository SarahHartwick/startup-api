class AddMoreColumnsToStartUps < ActiveRecord::Migration
  def change
    add_column :start_ups, :market, :string
    add_column :start_ups, :product, :string
    add_column :start_ups, :competition, :string
    add_column :start_ups, :advantage, :string
  end
end

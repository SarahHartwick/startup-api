class AddStrategyColumntoStartups < ActiveRecord::Migration
  def change
    add_column :start_ups, :strategy, :string
  end
end

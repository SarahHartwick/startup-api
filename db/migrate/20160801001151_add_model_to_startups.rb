class AddModelToStartups < ActiveRecord::Migration
  def change
    add_column :start_ups, :model, :string
  end
end

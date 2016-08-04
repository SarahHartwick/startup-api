class AddColumnsToCompetitors < ActiveRecord::Migration
  def change
    add_column :competitors, :name, :string
    add_column :competitors, :description, :string
    add_column :competitors, :url, :string
  end
end

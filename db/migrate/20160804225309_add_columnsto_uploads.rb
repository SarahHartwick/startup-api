class AddColumnstoUploads < ActiveRecord::Migration
  def change
    add_reference :uploads, :idea, index: true
    add_column :uploads, :location, :string
  end
end

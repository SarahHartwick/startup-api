class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :title
      t.string :photo
      t.string :linkedin
      t.references :idea, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

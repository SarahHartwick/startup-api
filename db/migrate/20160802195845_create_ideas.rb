class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :description
      t.string :problem
      t.string :solution
      t.string :market
      t.string :product
      t.string :model
      t.string :advantage
      t.string :strategy
      t.string :owner
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

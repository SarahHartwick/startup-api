class AddIdeatoCompetitors < ActiveRecord::Migration
  def change
    add_reference :competitors, :idea, index: true
  end
end

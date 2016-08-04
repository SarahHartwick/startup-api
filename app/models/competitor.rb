class Competitor < ActiveRecord::Base
  belongs_to :idea, inverse_of: :competitors
  validates :name, presence: true
end

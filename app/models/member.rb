class Member < ActiveRecord::Base
  belongs_to :idea, inverse_of: :members
end

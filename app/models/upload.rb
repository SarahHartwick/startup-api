class Upload < ActiveRecord::Base
  belongs_to :idea, inverse_of: :uploads
end

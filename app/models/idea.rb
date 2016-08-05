class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :competitors, inverse_of: :idea, dependent: :destroy
  has_many :uploads, inverse_of: :idea, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :person, presence: true
end

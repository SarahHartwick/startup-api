class StartUpSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :owner, :problem, :solution, :market,
  :product, :competition, :advantage, :model, :strategy
  has_one :user
end

class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :problem, :solution, :market, :product, :model, :advantage, :strategy, :owner, :person
  has_one :user
end

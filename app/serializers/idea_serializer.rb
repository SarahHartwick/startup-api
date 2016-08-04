class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :problem, :solution, :market, :product,
  :user, :model, :advantage, :competitors, :strategy, :owner, :person
  
  def competitors
    object.competitors.pluck(:id)
  end

end

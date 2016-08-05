class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :problem, :solution, :market, :product,
  :user, :model, :advantage, :competitors, :strategy, :owner, :person, :uploads

  def competitors
    object.competitors.pluck(:id)
  end

  def uploads
    object.uploads.pluck(:id)
  end

end

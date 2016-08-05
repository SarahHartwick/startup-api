class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :problem, :solution, :market, :product,
  :user, :model, :advantage, :competitors, :strategy, :owner, :person, :uploads,
  :members

  def competitors
    object.competitors.pluck(:id)
  end

  def uploads
    object.uploads.pluck(:id)
  end

  def members
    object.members.pluck(:id)
  end

end

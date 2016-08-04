class CompetitorSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url, :idea

  def idea
    object.idea.id
  end

end

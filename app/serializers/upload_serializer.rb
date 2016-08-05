class UploadSerializer < ActiveModel::Serializer
  attributes :id, :location, :idea

  def idea
    object.idea.id
  end
end

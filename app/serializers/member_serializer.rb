class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :photo, :linkedin, :idea

  def idea
    object.idea.id
  end
end

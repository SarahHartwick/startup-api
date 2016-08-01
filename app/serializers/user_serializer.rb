#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :givenname, :lastname, :location
end

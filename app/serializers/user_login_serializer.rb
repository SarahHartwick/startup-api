#
class UserLoginSerializer < ActiveModel::Serializer
  attributes :id, :email, :token, :givenname, :lastname, :location, :avatar

  def token
    Rails.application.message_verifier(:signed_token).generate(object.token)
  end
end

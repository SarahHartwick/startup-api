#
class User < ActiveRecord::Base
  include Authentication
  has_many :companies
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
  :default_url => "https://www.mautic.org/media/images/default_avatar.png", :storage => :s3, :bucket => "sarahhartwick"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

class Boat < ApplicationRecord
  has_attached_file :avatar, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
  attr_accessor :avatar_file_name
  attr_accessor :avatar_content_type
  attr_accessor :avatar_file_size
  attr_accessor :avatar_updated_at
  attr_accessor :avatar

  has_attached_file :avatar

end

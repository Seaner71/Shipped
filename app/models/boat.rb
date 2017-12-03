class Boat < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :jobs

  validates :user_id, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },  default_url: '/assets/default-boat-avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :name, presence: true
  validates :name, uniqueness: true
end

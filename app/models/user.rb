class User < ApplicationRecord
  has_many :boats, dependent: :destroy
  has_many :jobs, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }

  has_attached_file :avatar, styles: { medium: '152x152#' }, default_url: '/assets/default-user-avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end

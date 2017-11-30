class Job < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :boats

  register_currency :usd
  monetize :price_cents, currency => :usd,
        :numericality => {
        :greater_than_or_equal_to => 1000
        }
        validates :description, length: {minimum: 20}
         validates :name, presence: true
         validates :name, uniqueness: true
         validate :check_origin_and_destination

         validates :user_id, presence: true
         
         private
         def check_origin_and_destination
           errors.add(:destination, "can not be the same as origin") if origin == destination
         end

end

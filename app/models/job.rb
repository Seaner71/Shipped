class Job < ApplicationRecord

  belongs_to :user

  register_currency :usd
  monetize :price_cents, currency => :usd,
        :numericality => {
        :greater_than_or_equal_to => 1000
        }


end

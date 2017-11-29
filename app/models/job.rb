class Job < ApplicationRecord
<<<<<<< HEAD
  belongs_to :users
=======
  register_currency :usd
  monetize :price_cents, currency => :usd,
        :numericality => {
        :greater_than_or_equal_to => 1000
        }

>>>>>>> 8355442a97a98edbaf895498e2897c5b334a1ffc
end

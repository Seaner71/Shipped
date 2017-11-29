class MonetizeCostsForJobs < ActiveRecord::Migration[5.1]
  def change
    add_monetize :jobs, :price
  end
end

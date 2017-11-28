class AddLocationToBoats < ActiveRecord::Migration[5.1]
  def change
    add_column :boats, :location, :country_code
  end
end

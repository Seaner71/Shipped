class AddCountryCodeToBoats < ActiveRecord::Migration[5.1]
  def change
    add_column :boats, :country_code, :string
  end
end

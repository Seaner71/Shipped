class AddContainersNeededNameDescriptionToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :description, :text
    add_column :jobs, :name, :string
    add_column :jobs, :containers_needed, :integer
  end
end

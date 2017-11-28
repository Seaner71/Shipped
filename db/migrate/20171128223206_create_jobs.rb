class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :origin
      t.string :destination

      t.timestamps
    end
  end
end

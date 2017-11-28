class CreateBoats < ActiveRecord::Migration[4.2]
  def change
    create_table :boats do |t|
      t.string :name

      t.timestamps
    end
  end
end

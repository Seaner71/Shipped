class CreateBoatsAndJobs < ActiveRecord::Migration[5.1]
  # def change
  #   create_table :boats do |t|
  #     t.string :name
  #     t.timestamps
  #   end

    # create_table :jobs do |t|
    #   t.string :name
    #   t.timestamps
    # end
    create_table :boats_jobs, id: false do |t|
      t.belongs_to :boat, index: true
      t.belongs_to :job, index: true
    end
  end

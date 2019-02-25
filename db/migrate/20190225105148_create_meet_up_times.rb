class CreateMeetUpTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :meet_up_times do |t|
      t.datetime :meet_up_time
      t.boolean :user_first_accepted
      t.boolean :user_last_accepted

      t.timestamps
    end
  end
end

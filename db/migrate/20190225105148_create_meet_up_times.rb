class CreateMeetUpTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :meet_up_times do |t|
      t.datetime :meet_up_time
      t.boolean :first_user_accepted
      t.boolean :last_user_accepted

      t.timestamps
    end
  end
end

class AddAcceptedToMeetUpTimes < ActiveRecord::Migration[5.2]
  def change
    change_column :meet_up_times, :first_user_accepted
    change_column :meet_up_times, :last_user_accepted
  end
end

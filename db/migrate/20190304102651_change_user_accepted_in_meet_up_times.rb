class ChangeUserAcceptedInMeetUpTimes < ActiveRecord::Migration[5.2]
  def change
    remove_column :meet_up_times, :first_user_accepted
    remove_column :meet_up_times, :last_user_accepted
    add_reference :meet_up_times, :first_user_accepted, default: nil, foreign_key: { to_table: :users }
    add_reference :meet_up_times, :last_user_accepted, default: nil, foreign_key: { to_table: :users }
  end
end

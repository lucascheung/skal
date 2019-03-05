class ChangeUserAcceptedBackToBoolean < ActiveRecord::Migration[5.2]
  def change
    remove_reference :meet_up_times, :first_user_accepted
    remove_reference :meet_up_times, :last_user_accepted
    add_column :meet_up_times, :first_user_accepted, :boolean
    add_column :meet_up_times, :last_user_accepted, :boolean
  end
end

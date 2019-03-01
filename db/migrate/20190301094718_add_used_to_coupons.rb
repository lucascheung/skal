class AddUsedToCoupons < ActiveRecord::Migration[5.2]
  def change
    change_column :coupons, :used, :boolean, default: false
  end
end

class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.boolean :used
      t.datetime :expiry_date
      t.boolean :location_validated

      t.timestamps
    end
  end
end

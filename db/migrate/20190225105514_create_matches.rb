class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :bar, foreign_key: true
      t.references :meet_up_time, foreign_key: true
      t.references :coupon, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :bar, foreign_key: true
      t.references :meet_up_time, foreign_key: true
      t.references :coupon, foreign_key: true
      t.references :first_user
      t.references :last_user

      t.timestamps
    end
    add_foreign_key :matches, :users, column: :first_user_id, primary_key: :id
    add_foreign_key :matches, :users, column: :last_user_id, primary_key: :id
  end
end

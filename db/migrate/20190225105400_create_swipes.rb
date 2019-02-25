class CreateSwipes < ActiveRecord::Migration[5.2]
  def change
    create_table :swipes do |t|
      t.boolean :like
      t.references :swiper
      t.references :swipee
      t.timestamps
    end
    add_foreign_key :swipes, :users, column: :swiper_id, primary_key: :id
    add_foreign_key :swipes, :users, column: :swipee_id, primary_key: :id
  end
end

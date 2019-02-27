class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :user
      t.references :bar
      t.string :photo
      t.timestamps
    end
  end
end

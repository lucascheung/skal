class ContentToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :content, :string
  end
end

class Addrowbannerinterger < ActiveRecord::Migration
  def change
    add_column :banners, :row_order, :integer
  end
end

class Addrowmagazineiteger < ActiveRecord::Migration
  def change
    add_column :magazines, :row_order, :integer
  end
end
